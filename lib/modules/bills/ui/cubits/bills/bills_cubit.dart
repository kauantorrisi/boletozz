import 'package:boletozz/app_imports.dart';

part 'bills_state.dart';

class BillsCubit extends Cubit<BillsState> {
  BillsCubit() : super(BillsInitial()) {
    getAllBills();
  }

  Box<BillModel> billsBox = Hive.box<BillModel>('bills');

  List<BillModel> getAllBills() {
    emit(BillsLoading());
    emit(BillsLoaded(billsBox.values.toList()));
    return billsBox.values.toList();
  }

  Future<void> addBillByScan(TextEditingController nameController) async {
    try {
      emit(BillsLoading());

      String barcode = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000',
        'Cancelar',
        true,
        ScanMode.BARCODE,
      );

      final BoletoUtils boletoUtils = BoletoUtils();

      barcode = boletoUtils.codBarrasParaLinhaDigitavel(barcode: barcode);

      BoletoValidado validatedBill = boletoUtils.validarBoleto(barcode);
      if (!billsBox.containsKey(barcode)) {
        billsBox.put(
          barcode,
          BillModel(
            name: nameController.text.isEmpty
                ? validatedBill.bancoEmissor?.banco ?? ""
                : nameController.text,
            emittingBank: validatedBill.bancoEmissor?.banco ?? "",
            code: barcode,
            value: validatedBill.valor!,
            dueDate: validatedBill.vencimento!,
          ),
        );

        emit(BillsLoaded(getAllBills()));
      } else {
        emit(BillsError("Erro ao adicionar boleto", "Boleto já cadastrado!"));
        emit(BillsLoaded(getAllBills()));
      }

      nameController.clear();
    } catch (e) {
      emit(BillsError("Erro ao adicionar boleto", e.toString()));
      emit(BillsLoaded(getAllBills()));
    }
  }

  Future<void> addBillByFile(TextEditingController nameController) async {
    emit(BillsLoading());
    final pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      final filePath = pickedFile.files.single.path;
      if (filePath != null) {
        try {
          return await BarcodeFinder.scanFile(path: filePath).then(
            (barcode) {
              if (barcode != null && !billsBox.containsKey(barcode)) {
                final BoletoUtils boletoUtils = BoletoUtils();

                barcode =
                    boletoUtils.codBarrasParaLinhaDigitavel(barcode: barcode);

                BoletoValidado validatedBill =
                    boletoUtils.validarBoleto(barcode);

                billsBox.put(
                  barcode,
                  BillModel(
                    name: nameController.text.isEmpty
                        ? validatedBill.bancoEmissor?.banco ?? ""
                        : nameController.text,
                    emittingBank: validatedBill.bancoEmissor?.banco ?? "",
                    code: barcode,
                    value: validatedBill.valor!,
                    dueDate: validatedBill.vencimento!,
                  ),
                );
              } else {
                emit(
                  BillsError(
                      "Erro ao adicionar boleto", "Boleto já cadastrado!"),
                );
                emit(BillsLoaded(getAllBills()));
              }
              nameController.clear();
            },
          );
        } catch (e) {
          emit(BillsError("Erro ao adicionar boleto", e.toString()));
          emit(BillsLoaded(getAllBills()));
        }
      } else {
        nameController.clear();
        emit(
          BillsError("Erro ao adicionar boleto",
              "Não foi possível identificar o arquivo!"),
        );
        emit(BillsLoaded(getAllBills()));
      }
    } else {
      nameController.clear();
      emit(BillsLoaded(getAllBills()));
    }
  }

  void updateBill(BillModel bill) {
    emit(BillsLoading());
    if (billsBox.containsKey(bill.code)) {
      billsBox.put(bill.code, bill);
    }
    emit(BillsLoaded(getAllBills()));
  }

  void removeBill(BillModel bill) {
    emit(BillsLoading());
    if (billsBox.containsKey(bill.code)) {
      billsBox.delete(bill.code);
    }
    emit(BillsLoaded(getAllBills()));
  }

  void toggleBillPaymentStatus(BillModel bill) {
    emit(BillsLoading());
    bill.isPaid = !bill.isPaid;
    bill.paymentDate = bill.isPaid ? DateTime.now() : bill.dueDate;
    if (billsBox.containsKey(bill.code)) {
      billsBox.put(bill.code, bill);
    }
    emit(BillsLoaded(getAllBills()));
  }

  // bool isFilteringBillsByPaymentStatus = false;
  // bool isFilteringByDueDateInAscendingOrder = false;

  // bool isFilteringByValueInAscendingOrder = false;

  // void searchBills(String value) {
  //   emit(BillsLoading());
  //   if (value.isNotEmpty) {
  //     List<BillModel> filteredBills = mockupBills
  //         .where((bill) => bill.name
  //             .toLowerCase()
  //             .trim()
  //             .contains(value.toLowerCase().trim()))
  //         .toList();
  //     emit(BillsLoaded(filteredBills));
  //   } else {
  //     emit(BillsLoaded(mockupBills));
  //   }
  // }

  // void toggleIsFilteringBillsByPaymentStatus() {
  //   isFilteringBillsByPaymentStatus = !isFilteringBillsByPaymentStatus;
  // }

  // void filterBillsByPaymentStatus() {
  //   emit(BillsLoading());
  //   if (isFilteringBillsByPaymentStatus) {
  //     List<BillModel> filteredBills =
  //         mockupBills.where((bill) => !bill.isPaid).toList();
  //     emit(BillsLoaded(filteredBills));
  //   } else if (isFilteringBillsByPaymentStatus == false) {
  //     List<BillModel> filteredBills =
  //         mockupBills.where((bill) => bill.isPaid).toList();
  //     emit(BillsLoaded(filteredBills));
  //   } else {
  //     emit(BillsLoaded(mockupBills));
  //   }
  // }

  // void filterBillsByDueDate() {
  //   emit(BillsLoading());
  //   if (isFilteringByDueDateInAscendingOrder == false) {
  //     List<BillModel> filteredBills = mockupBills
  //       ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  //     emit(BillsLoaded(filteredBills));
  //   } else if (isFilteringByDueDateInAscendingOrder) {
  //     List<BillModel> filteredBills = mockupBills
  //       ..sort((a, b) => b.dueDate.compareTo(a.dueDate));
  //     emit(BillsLoaded(filteredBills));
  //   } else {
  //     emit(BillsLoaded(mockupBills));
  //   }
  // }

  // void filterByBillValue() {
  //   emit(BillsLoading());
  //   if (isFilteringByValueInAscendingOrder == false) {
  //     List<BillModel> filteredBills = mockupBills
  //       ..sort((a, b) => a.value.compareTo(b.value));
  //     emit(BillsLoaded(filteredBills));
  //   } else if (isFilteringByValueInAscendingOrder) {
  //     List<BillModel> filteredBills = mockupBills
  //       ..sort((a, b) => b.value.compareTo(a.value));
  //     emit(BillsLoaded(filteredBills));
  //   } else {
  //     emit(BillsLoaded(mockupBills));
  //   }
  // }

  // void clearFilters() => emit(BillsLoaded(mockupBills));
}
