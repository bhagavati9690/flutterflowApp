import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).lemonLime,
                child: Image.asset(
                  'assets/images/playstore-icon.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).lemonLime,
                    child: Image.asset(
                      'assets/images/playstore-icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : HomePageWidget(),
          routes: [
            FFRoute(
              name: VenueDetailsWidget.routeName,
              path: VenueDetailsWidget.routePath,
              builder: (context, params) => VenueDetailsWidget(
                venueId: params.getParam(
                  'venueId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: AllVenueWidget.routeName,
              path: AllVenueWidget.routePath,
              builder: (context, params) => AllVenueWidget(
                venueSearchQuery: params.getParam(
                  'venueSearchQuery',
                  ParamType.String,
                ),
                venueTypeAgg: params.getParam<String>(
                  'venueTypeAgg',
                  ParamType.String,
                  isList: true,
                ),
                ageRangeAgg: params.getParam<String>(
                  'ageRangeAgg',
                  ParamType.String,
                  isList: true,
                ),
                activityTypeAgg: params.getParam<String>(
                  'activityTypeAgg',
                  ParamType.String,
                  isList: true,
                ),
                sportstypeAgg: params.getParam<String>(
                  'sportstypeAgg',
                  ParamType.String,
                  isList: true,
                ),
                placeTypeSelection: params.getParam(
                  'placeTypeSelection',
                  ParamType.String,
                ),
                selectedDistance: params.getParam(
                  'selectedDistance',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MapPOCWidget.routeName,
              path: MapPOCWidget.routePath,
              builder: (context, params) => MapPOCWidget(),
            ),
            FFRoute(
              name: LocationSerchbarPOCWidget.routeName,
              path: LocationSerchbarPOCWidget.routePath,
              builder: (context, params) => LocationSerchbarPOCWidget(),
            ),
            FFRoute(
              name: SingleMapPOCWidget.routeName,
              path: SingleMapPOCWidget.routePath,
              builder: (context, params) => SingleMapPOCWidget(),
            ),
            FFRoute(
              name: VenuePackageDetailsWidget.routeName,
              path: VenuePackageDetailsWidget.routePath,
              builder: (context, params) => VenuePackageDetailsWidget(
                packageId: params.getParam(
                  'packageId',
                  ParamType.String,
                ),
                resourseId: params.getParam(
                  'resourseId',
                  ParamType.String,
                ),
                resouceItemId: params.getParam(
                  'resouceItemId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LoginWidget.routeName,
              path: LoginWidget.routePath,
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: VenueSpaceDetailsWidget.routeName,
              path: VenueSpaceDetailsWidget.routePath,
              builder: (context, params) => VenueSpaceDetailsWidget(
                resourseId: params.getParam(
                  'resourseId',
                  ParamType.String,
                ),
                par1: params.getParam(
                  'par1',
                  ParamType.String,
                ),
                par2: params.getParam(
                  'par2',
                  ParamType.String,
                ),
                par3: params.getParam(
                  'par3',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ForgotPasswordWidget.routeName,
              path: ForgotPasswordWidget.routePath,
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: MyProfileWidget.routeName,
              path: MyProfileWidget.routePath,
              builder: (context, params) => MyProfileWidget(),
            ),
            FFRoute(
              name: MyAccountWidget.routeName,
              path: MyAccountWidget.routePath,
              builder: (context, params) => MyAccountWidget(),
            ),
            FFRoute(
              name: ResetPasswordWidget.routeName,
              path: ResetPasswordWidget.routePath,
              builder: (context, params) => ResetPasswordWidget(
                keyResetPassword: params.getParam(
                  'keyResetPassword',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyEventsWidget.routeName,
              path: MyEventsWidget.routePath,
              builder: (context, params) => MyEventsWidget(
                tab: params.getParam(
                  'tab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: VenueSearchWidget.routeName,
              path: VenueSearchWidget.routePath,
              builder: (context, params) => VenueSearchWidget(),
            ),
            FFRoute(
              name: AllSearchWidget.routeName,
              path: AllSearchWidget.routePath,
              builder: (context, params) => AllSearchWidget(),
            ),
            FFRoute(
              name: AnonymousLoginGuestUIWidget.routeName,
              path: AnonymousLoginGuestUIWidget.routePath,
              builder: (context, params) => AnonymousLoginGuestUIWidget(
                params: params.getParam<NameIdSearchableStruct>(
                  'params',
                  ParamType.DataStruct,
                  isList: true,
                  structBuilder: NameIdSearchableStruct.fromSerializableMap,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.String,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.String,
                ),
                denominatorId: params.getParam(
                  'denominatorId',
                  ParamType.bool,
                ),
                resourceItemId: params.getParam(
                  'resourceItemId',
                  ParamType.String,
                ),
                resourceItemType: params.getParam(
                  'resourceItemType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
                customCake: params.getParam(
                  'customCake',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: GuestFormWidget.routeName,
              path: GuestFormWidget.routePath,
              builder: (context, params) => GuestFormWidget(
                guestId: params.getParam<String>(
                  'guestId',
                  ParamType.String,
                  isList: true,
                ),
                isEditForm: params.getParam(
                  'isEditForm',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: GuestDetailsWidget.routeName,
              path: GuestDetailsWidget.routePath,
              builder: (context, params) => GuestDetailsWidget(
                eventId: params.getParam(
                  'eventId',
                  ParamType.String,
                ),
                guestId: params.getParam<String>(
                  'guestId',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: ContactListWidget.routeName,
              path: ContactListWidget.routePath,
              builder: (context, params) => ContactListWidget(
                contacts: params.getParam<ContactStruct>(
                  'contacts',
                  ParamType.DataStruct,
                  isList: true,
                  structBuilder: ContactStruct.fromSerializableMap,
                ),
                guestType: params.getParam(
                  'guestType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EventReadOnlyPageWidget.routeName,
              path: EventReadOnlyPageWidget.routePath,
              builder: (context, params) => EventReadOnlyPageWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.String,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.String,
                ),
                denominatorId: params.getParam(
                  'denominatorId',
                  ParamType.bool,
                ),
                resourceItemId: params.getParam(
                  'resourceItemId',
                  ParamType.String,
                ),
                resourceItemType: params.getParam(
                  'resourceItemType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
                customCake: params.getParam(
                  'customCake',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: DateAndTimeTab1Widget.routeName,
              path: DateAndTimeTab1Widget.routePath,
              builder: (context, params) => DateAndTimeTab1Widget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.int,
                ),
                type: params.getParam(
                  'type',
                  ParamType.int,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.int,
                ),
                denominatorId: params.getParam(
                  'denominatorId',
                  ParamType.int,
                ),
                denomName: params.getParam(
                  'denomName',
                  ParamType.String,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.int,
                ),
                resourceItemType: params.getParam(
                  'resourceItemType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SignupWidget.routeName,
              path: SignupWidget.routePath,
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: PackageVariationPageWidget.routeName,
              path: PackageVariationPageWidget.routePath,
              builder: (context, params) => PackageVariationPageWidget(
                resourceItemId: params.getParam(
                  'resourceItemId',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.int,
                ),
                type: params.getParam(
                  'type',
                  ParamType.int,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.int,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: AddOnPageInWizardWidget.routeName,
              path: AddOnPageInWizardWidget.routePath,
              builder: (context, params) => AddOnPageInWizardWidget(
                parentRecordkey: params.getParam(
                  'parentRecordkey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                item: params.getParam(
                  'item',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                resourceType: params.getParam(
                  'resourceType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AddOnGroupInWizardWidget.routeName,
              path: AddOnGroupInWizardWidget.routePath,
              builder: (context, params) => AddOnGroupInWizardWidget(
                currentGroupId: params.getParam(
                  'currentGroupId',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: GreetingPageWidget.routeName,
              path: GreetingPageWidget.routePath,
              builder: (context, params) => GreetingPageWidget(
                hasRequests: params.getParam(
                  'hasRequests',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AnonymousInfoForShoppingCartWidget.routeName,
              path: AnonymousInfoForShoppingCartWidget.routePath,
              builder: (context, params) => AnonymousInfoForShoppingCartWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.String,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.String,
                ),
                denominatorId: params.getParam(
                  'denominatorId',
                  ParamType.bool,
                ),
                resourceItemId: params.getParam(
                  'resourceItemId',
                  ParamType.String,
                ),
                from: params.getParam(
                  'from',
                  ParamType.String,
                ),
                resourceItemType: params.getParam(
                  'resourceItemType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
                customCake: params.getParam(
                  'customCake',
                  ParamType.bool,
                ),
                nextUI: params.getParam(
                  'nextUI',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RentalDetailsWidget.routeName,
              path: RentalDetailsWidget.routePath,
              builder: (context, params) => RentalDetailsWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RentalItemWidget.routeName,
              path: RentalItemWidget.routePath,
              builder: (context, params) => RentalItemWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RentaPackageWidget.routeName,
              path: RentaPackageWidget.routePath,
              builder: (context, params) => RentaPackageWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RentalSearchWidget.routeName,
              path: RentalSearchWidget.routePath,
              builder: (context, params) => RentalSearchWidget(),
            ),
            FFRoute(
              name: FoodSinglePageCartDetailsWidget.routeName,
              path: FoodSinglePageCartDetailsWidget.routePath,
              builder: (context, params) => FoodSinglePageCartDetailsWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                resourceType: params.getParam(
                  'resourceType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
                variationKey: params.getParam(
                  'variationKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RentalItemDetailsWidget.routeName,
              path: RentalItemDetailsWidget.routePath,
              builder: (context, params) => RentalItemDetailsWidget(
                rentalItemId: params.getParam(
                  'rentalItemId',
                  ParamType.String,
                ),
                variationId: params.getParam(
                  'variationId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ShoppingCartDeliveryPageWidget.routeName,
              path: ShoppingCartDeliveryPageWidget.routePath,
              builder: (context, params) => ShoppingCartDeliveryPageWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                resourceType: params.getParam(
                  'resourceType',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AllEntertainerWidget.routeName,
              path: AllEntertainerWidget.routePath,
              builder: (context, params) => AllEntertainerWidget(
                entertainerSerchQuery: params.getParam(
                  'entertainerSerchQuery',
                  ParamType.String,
                ),
                entertainercategory: params.getParam<String>(
                  'entertainercategory',
                  ParamType.String,
                  isList: true,
                ),
                categoryId: params.getParam(
                  'categoryId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EntertainerDetailsWidget.routeName,
              path: EntertainerDetailsWidget.routePath,
              builder: (context, params) => EntertainerDetailsWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CustomCakeDNTWidget.routeName,
              path: CustomCakeDNTWidget.routePath,
              builder: (context, params) => CustomCakeDNTWidget(
                bakeryId: params.getParam(
                  'bakeryId',
                  ParamType.String,
                ),
                menuSectionId: params.getParam(
                  'menuSectionId',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EntertainerSearchWidget.routeName,
              path: EntertainerSearchWidget.routePath,
              builder: (context, params) => EntertainerSearchWidget(),
            ),
            FFRoute(
              name: FlavoursPageWidget.routeName,
              path: FlavoursPageWidget.routePath,
              builder: (context, params) => FlavoursPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FillingsPageWidget.routeName,
              path: FillingsPageWidget.routePath,
              builder: (context, params) => FillingsPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ShapesPageWidget.routeName,
              path: ShapesPageWidget.routePath,
              builder: (context, params) => ShapesPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: IcingPageWidget.routeName,
              path: IcingPageWidget.routePath,
              builder: (context, params) => IcingPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ColorPageWidget.routeName,
              path: ColorPageWidget.routePath,
              builder: (context, params) => ColorPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LayerPageWidget.routeName,
              path: LayerPageWidget.routePath,
              builder: (context, params) => LayerPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: DecorPageWidget.routeName,
              path: DecorPageWidget.routePath,
              builder: (context, params) => DecorPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: BorderPageWidget.routeName,
              path: BorderPageWidget.routePath,
              builder: (context, params) => BorderPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AllCakesWidget.routeName,
              path: AllCakesWidget.routePath,
              builder: (context, params) => AllCakesWidget(
                cakeSerchQuery: params.getParam(
                  'cakeSerchQuery',
                  ParamType.String,
                ),
                themeCategory: params.getParam<String>(
                  'themeCategory',
                  ParamType.String,
                  isList: true,
                ),
                themeId: params.getParam(
                  'themeId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EntertainerItemWidget.routeName,
              path: EntertainerItemWidget.routePath,
              builder: (context, params) => EntertainerItemWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EntertainerPackageWidget.routeName,
              path: EntertainerPackageWidget.routePath,
              builder: (context, params) => EntertainerPackageWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CakeSearchWidget.routeName,
              path: CakeSearchWidget.routePath,
              builder: (context, params) => CakeSearchWidget(),
            ),
            FFRoute(
              name: ReadyMadeCustomizationPageWidget.routeName,
              path: ReadyMadeCustomizationPageWidget.routePath,
              builder: (context, params) => ReadyMadeCustomizationPageWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                customizationType: params.getParam(
                  'customizationType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CakeDetailsWidget.routeName,
              path: CakeDetailsWidget.routePath,
              builder: (context, params) => CakeDetailsWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CakeItemWidget.routeName,
              path: CakeItemWidget.routePath,
              builder: (context, params) => CakeItemWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ChangePasswordWidget.routeName,
              path: ChangePasswordWidget.routePath,
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: DateAndTimeTab1CopyWidget.routeName,
              path: DateAndTimeTab1CopyWidget.routePath,
              builder: (context, params) => DateAndTimeTab1CopyWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.int,
                ),
                type: params.getParam(
                  'type',
                  ParamType.int,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.int,
                ),
                denominatorId: params.getParam(
                  'denominatorId',
                  ParamType.int,
                ),
                denomName: params.getParam(
                  'denomName',
                  ParamType.String,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.int,
                ),
                resourceItemType: params.getParam(
                  'resourceItemType',
                  ParamType.String,
                ),
                quantity: params.getParam(
                  'quantity',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyFormWidget.routeName,
              path: MyFormWidget.routePath,
              builder: (context, params) => MyFormWidget(),
            ),
            FFRoute(
              name: FamilyMemberListWidget.routeName,
              path: FamilyMemberListWidget.routePath,
              builder: (context, params) => FamilyMemberListWidget(),
            ),
            FFRoute(
              name: HomePageWidget.routeName,
              path: HomePageWidget.routePath,
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: EventFormWidget.routeName,
              path: EventFormWidget.routePath,
              builder: (context, params) => EventFormWidget(
                eventId: params.getParam(
                  'eventId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ShoppingCartSummaryCopyWidget.routeName,
              path: ShoppingCartSummaryCopyWidget.routePath,
              builder: (context, params) => ShoppingCartSummaryCopyWidget(),
            ),
            FFRoute(
              name: EventInfoForShoppingCartWidget.routeName,
              path: EventInfoForShoppingCartWidget.routePath,
              builder: (context, params) => EventInfoForShoppingCartWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                type: params.getParam(
                  'type',
                  ParamType.String,
                ),
                packageId: params.getParam(
                  'packageId',
                  ParamType.String,
                ),
                spaceId: params.getParam(
                  'spaceId',
                  ParamType.String,
                ),
                denominatorId: params.getParam(
                  'denominatorId',
                  ParamType.bool,
                ),
                resourceItemId: params.getParam(
                  'resourceItemId',
                  ParamType.String,
                ),
                resourceItemType: params.getParam(
                  'resourceItemType',
                  ParamType.String,
                ),
                quantitys: params.getParam(
                  'quantitys',
                  ParamType.String,
                ),
                customCake: params.getParam(
                  'customCake',
                  ParamType.bool,
                ),
                nextUI: params.getParam(
                  'nextUI',
                  ParamType.String,
                ),
                from: params.getParam(
                  'from',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AllRentalWidget.routeName,
              path: AllRentalWidget.routePath,
              builder: (context, params) => AllRentalWidget(
                rentalSerchQuery: params.getParam(
                  'rentalSerchQuery',
                  ParamType.String,
                ),
                rentalsectioncategory: params.getParam<String>(
                  'rentalsectioncategory',
                  ParamType.String,
                  isList: true,
                ),
                categoryId: params.getParam(
                  'categoryId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CustomCakeDeliveryTabWidget.routeName,
              path: CustomCakeDeliveryTabWidget.routePath,
              builder: (context, params) => CustomCakeDeliveryTabWidget(
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                index: params.getParam(
                  'index',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FamilyMemberFormWidget.routeName,
              path: FamilyMemberFormWidget.routePath,
              builder: (context, params) => FamilyMemberFormWidget(
                memberId: params.getParam(
                  'memberId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FriendListWidget.routeName,
              path: FriendListWidget.routePath,
              builder: (context, params) => FriendListWidget(),
            ),
            FFRoute(
              name: FriendFormWidget.routeName,
              path: FriendFormWidget.routePath,
              builder: (context, params) => FriendFormWidget(
                friendId: params.getParam(
                  'friendId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AllChatsWidget.routeName,
              path: AllChatsWidget.routePath,
              builder: (context, params) => AllChatsWidget(),
            ),
            FFRoute(
              name: ContactListForFriendWidget.routeName,
              path: ContactListForFriendWidget.routePath,
              builder: (context, params) => ContactListForFriendWidget(
                contacts: params.getParam<ContactStruct>(
                  'contacts',
                  ParamType.DataStruct,
                  isList: true,
                  structBuilder: ContactStruct.fromSerializableMap,
                ),
                memberType: params.getParam(
                  'memberType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ChatDetailWidget.routeName,
              path: ChatDetailWidget.routePath,
              builder: (context, params) => ChatDetailWidget(
                receivedChat: params.getParam(
                  'receivedChat',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chat'],
                ),
              ),
            ),
            FFRoute(
              name: VendorOrderPageWidget.routeName,
              path: VendorOrderPageWidget.routePath,
              builder: (context, params) => VendorOrderPageWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                preSelectedTab: params.getParam(
                  'preSelectedTab',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VendorAllEmployeesWidget.routeName,
              path: VendorAllEmployeesWidget.routePath,
              builder: (context, params) => VendorAllEmployeesWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VendorRequestWidget.routeName,
              path: VendorRequestWidget.routePath,
              builder: (context, params) => VendorRequestWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RespondRequestListWidget.routeName,
              path: RespondRequestListWidget.routePath,
              builder: (context, params) => RespondRequestListWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LinkRenderPageWidget.routeName,
              path: LinkRenderPageWidget.routePath,
              builder: (context, params) => LinkRenderPageWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
                link: params.getParam(
                  'link',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RespondRequestChoiceTabSetWidget.routeName,
              path: RespondRequestChoiceTabSetWidget.routePath,
              builder: (context, params) => RespondRequestChoiceTabSetWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                keyKey: params.getParam(
                  'keyKey',
                  ParamType.String,
                ),
                selection: params.getParam(
                  'selection',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VendorDashboardWidget.routeName,
              path: VendorDashboardWidget.routePath,
              builder: (context, params) => VendorDashboardWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VendorAllOrderDetailsWidget.routeName,
              path: VendorAllOrderDetailsWidget.routePath,
              builder: (context, params) => VendorAllOrderDetailsWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VendorScheduleWidget.routeName,
              path: VendorScheduleWidget.routePath,
              builder: (context, params) => VendorScheduleWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VendorInquiryResponseWidget.routeName,
              path: VendorInquiryResponseWidget.routePath,
              builder: (context, params) => VendorInquiryResponseWidget(
                parentRecordKey: params.getParam(
                  'parentRecordKey',
                  ParamType.String,
                ),
                recordKey: params.getParam(
                  'recordKey',
                  ParamType.String,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
