// Core - Common - Design
export './core/common/design/app_pallete.dart';
export './core/common/design/app_sizes.dart';

// Core - Common - Theme
export './core/common/design/theme/theme.dart';
export './core/common/design/theme/custom_themes/elevated_button_theme.dart';
export './core/common/design/theme/custom_themes/floating_action_button_theme.dart';
export './core/common/design/theme/custom_themes/input_decoration_themes.dart';
export './core/common/design/theme/custom_themes/text_themes.dart';

// Core - Common - Widgets
export './core/common/widgets/loader.dart';

// Core - Configs
export './core/configs/hive_config.dart';

// Core - Utils - Validators
export './core/utils/validators/validation.dart';

//Core - Utils - Helper Functions
export './core/utils/helper_functions.dart';

// --------------------------------------------

// Features - Bills - Cubit
export 'modules/bills/ui/cubits/bills/bills_cubit.dart';

// Features - Bills - Models
export 'modules/bills/data/models/bill_model.dart';

// Features - Bills - Pages
export 'modules/bills/ui/pages/home_page.dart';
export 'modules/bills/ui/pages/splash_page.dart';
export 'modules/bills/ui/pages/bill_details_page.dart';

// Features - Bills - Widgets
export 'modules/bills/widgets/bill_fab_widget.dart';
export 'modules/bills/widgets/menu_button_widget.dart';
export 'modules/bills/widgets/search_bar_widget.dart';
export 'modules/bills/widgets/text_with_divider_widget.dart';

// --------------------------------------------

// App Widget
export 'app_widget.dart';

// Flutter
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:io' hide ContentType;

// --------------------------------------------

// Packages

export 'package:hive/hive.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_lucide/flutter_lucide.dart';
export 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
export 'package:file_picker/file_picker.dart';
export 'package:boleto_utils/boleto_utils.dart';
export 'package:barcode_finder/barcode_finder.dart';
export 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
export 'package:path_provider/path_provider.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:loading_animation_widget/loading_animation_widget.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_speed_dial/flutter_speed_dial.dart';
export 'package:go_router/go_router.dart';
