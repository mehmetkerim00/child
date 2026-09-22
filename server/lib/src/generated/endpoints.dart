/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/dev_endpoint.dart' as _i3;
import '../endpoints/directory_endpoint.dart' as _i4;
import '../endpoints/profile_endpoint.dart' as _i5;
import '../endpoints/rides_endpoint.dart' as _i6;
import '../endpoints/routes_endpoint.dart' as _i7;
import '../health/health_endpoint.dart' as _i8;
import 'package:child_server/src/generated/family.dart' as _i9;
import 'package:child_server/src/generated/parent.dart' as _i10;
import 'package:child_server/src/generated/child.dart' as _i11;
import 'package:child_server/src/generated/driver.dart' as _i12;
import 'package:child_server/src/generated/institution.dart' as _i13;
import 'package:child_server/src/generated/circle_rank.dart' as _i14;
import 'package:child_server/src/generated/ride_event_submission.dart' as _i15;
import 'package:child_server/src/generated/ride_location_point.dart' as _i16;
import 'package:child_server/src/generated/route_template.dart' as _i17;
import 'package:child_server/src/generated/future_calls.dart' as _i18;
export 'future_calls.dart' show ServerpodFutureCallsGetter;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'dev': _i3.DevEndpoint()
        ..initialize(
          server,
          'dev',
          null,
        ),
      'directory': _i4.DirectoryEndpoint()
        ..initialize(
          server,
          'directory',
          null,
        ),
      'profile': _i5.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'rides': _i6.RidesEndpoint()
        ..initialize(
          server,
          'rides',
          null,
        ),
      'routes': _i7.RoutesEndpoint()
        ..initialize(
          server,
          'routes',
          null,
        ),
      'health': _i8.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'requestCode': _i1.MethodConnector(
          name: 'requestCode',
          params: {
            'phoneInput': _i1.ParameterDescription(
              name: 'phoneInput',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).requestCode(
                session,
                params['phoneInput'],
              ),
        ),
        'verifyCode': _i1.MethodConnector(
          name: 'verifyCode',
          params: {
            'phoneInput': _i1.ParameterDescription(
              name: 'phoneInput',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).verifyCode(
                session,
                params['phoneInput'],
                params['code'],
              ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).logout(session),
        ),
      },
    );
    connectors['dev'] = _i1.EndpointConnector(
      name: 'dev',
      endpoint: endpoints['dev']!,
      methodConnectors: {
        'seed': _i1.MethodConnector(
          name: 'seed',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['dev'] as _i3.DevEndpoint).seed(session),
        ),
      },
    );
    connectors['directory'] = _i1.EndpointConnector(
      name: 'directory',
      endpoint: endpoints['directory']!,
      methodConnectors: {
        'families': _i1.MethodConnector(
          name: 'families',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .families(session),
        ),
        'saveFamily': _i1.MethodConnector(
          name: 'saveFamily',
          params: {
            'family': _i1.ParameterDescription(
              name: 'family',
              type: _i1.getType<_i9.Family>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).saveFamily(
                    session,
                    params['family'],
                  ),
        ),
        'deleteFamily': _i1.MethodConnector(
          name: 'deleteFamily',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .deleteFamily(
                    session,
                    params['familyId'],
                  ),
        ),
        'parents': _i1.MethodConnector(
          name: 'parents',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).parents(
                    session,
                    params['familyId'],
                  ),
        ),
        'saveParent': _i1.MethodConnector(
          name: 'saveParent',
          params: {
            'parent': _i1.ParameterDescription(
              name: 'parent',
              type: _i1.getType<_i10.Parent>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).saveParent(
                    session,
                    params['parent'],
                  ),
        ),
        'children': _i1.MethodConnector(
          name: 'children',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).children(
                    session,
                    familyId: params['familyId'],
                  ),
        ),
        'saveChild': _i1.MethodConnector(
          name: 'saveChild',
          params: {
            'child': _i1.ParameterDescription(
              name: 'child',
              type: _i1.getType<_i11.Child>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).saveChild(
                    session,
                    params['child'],
                  ),
        ),
        'deleteChild': _i1.MethodConnector(
          name: 'deleteChild',
          params: {
            'childId': _i1.ParameterDescription(
              name: 'childId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).deleteChild(
                    session,
                    params['childId'],
                  ),
        ),
        'drivers': _i1.MethodConnector(
          name: 'drivers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .drivers(session),
        ),
        'saveDriver': _i1.MethodConnector(
          name: 'saveDriver',
          params: {
            'driver': _i1.ParameterDescription(
              name: 'driver',
              type: _i1.getType<_i12.Driver>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).saveDriver(
                    session,
                    params['driver'],
                  ),
        ),
        'institutions': _i1.MethodConnector(
          name: 'institutions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .institutions(session),
        ),
        'saveInstitution': _i1.MethodConnector(
          name: 'saveInstitution',
          params: {
            'institution': _i1.ParameterDescription(
              name: 'institution',
              type: _i1.getType<_i13.Institution>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .saveInstitution(
                    session,
                    params['institution'],
                  ),
        ),
        'circle': _i1.MethodConnector(
          name: 'circle',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).circle(
                    session,
                    params['familyId'],
                  ),
        ),
        'assignDriver': _i1.MethodConnector(
          name: 'assignDriver',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'driverId': _i1.ParameterDescription(
              name: 'driverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'rank': _i1.ParameterDescription(
              name: 'rank',
              type: _i1.getType<_i14.CircleRank>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .assignDriver(
                    session,
                    familyId: params['familyId'],
                    driverId: params['driverId'],
                    rank: params['rank'],
                  ),
        ),
        'routes': _i1.MethodConnector(
          name: 'routes',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .routes(session),
        ),
        'pendingRoutes': _i1.MethodConnector(
          name: 'pendingRoutes',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .pendingRoutes(session),
        ),
        'activateRoute': _i1.MethodConnector(
          name: 'activateRoute',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'driverId': _i1.ParameterDescription(
              name: 'driverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'pricePerRideTenge': _i1.ParameterDescription(
              name: 'pricePerRideTenge',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .activateRoute(
                    session,
                    routeId: params['routeId'],
                    driverId: params['driverId'],
                    pricePerRideTenge: params['pricePerRideTenge'],
                  ),
        ),
        'deactivateRoute': _i1.MethodConnector(
          name: 'deactivateRoute',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .deactivateRoute(
                    session,
                    params['routeId'],
                  ),
        ),
        'generateUpcomingRides': _i1.MethodConnector(
          name: 'generateUpcomingRides',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .generateUpcomingRides(session),
        ),
        'ridesForDate': _i1.MethodConnector(
          name: 'ridesForDate',
          params: {
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .ridesForDate(
                    session,
                    date: params['date'],
                  ),
        ),
        'rideEvents': _i1.MethodConnector(
          name: 'rideEvents',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).rideEvents(
                    session,
                    params['rideId'],
                  ),
        ),
        'openTasks': _i1.MethodConnector(
          name: 'openTasks',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .openTasks(session),
        ),
        'resolveTask': _i1.MethodConnector(
          name: 'resolveTask',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).resolveTask(
                    session,
                    params['taskId'],
                  ),
        ),
        'notifications': _i1.MethodConnector(
          name: 'notifications',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .notifications(session),
        ),
        'sendManualSms': _i1.MethodConnector(
          name: 'sendManualSms',
          params: {
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'body': _i1.ParameterDescription(
              name: 'body',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .sendManualSms(
                    session,
                    phone: params['phone'],
                    body: params['body'],
                  ),
        ),
        'pendingTopUps': _i1.MethodConnector(
          name: 'pendingTopUps',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .pendingTopUps(session),
        ),
        'confirmTopUp': _i1.MethodConnector(
          name: 'confirmTopUp',
          params: {
            'topUpId': _i1.ParameterDescription(
              name: 'topUpId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .confirmTopUp(
                    session,
                    params['topUpId'],
                  ),
        ),
        'rejectTopUp': _i1.MethodConnector(
          name: 'rejectTopUp',
          params: {
            'topUpId': _i1.ParameterDescription(
              name: 'topUpId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['directory'] as _i4.DirectoryEndpoint).rejectTopUp(
                    session,
                    topUpId: params['topUpId'],
                    reason: params['reason'],
                  ),
        ),
        'adjustBalance': _i1.MethodConnector(
          name: 'adjustBalance',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'amountTenge': _i1.ParameterDescription(
              name: 'amountTenge',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .adjustBalance(
                    session,
                    familyId: params['familyId'],
                    amountTenge: params['amountTenge'],
                    reason: params['reason'],
                  ),
        ),
        'familyBalance': _i1.MethodConnector(
          name: 'familyBalance',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['directory'] as _i4.DirectoryEndpoint)
                  .familyBalance(
                    session,
                    params['familyId'],
                  ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'myFamily': _i1.MethodConnector(
          name: 'myFamily',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i5.ProfileEndpoint).myFamily(
                session,
              ),
        ),
        'myChildren': _i1.MethodConnector(
          name: 'myChildren',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i5.ProfileEndpoint)
                  .myChildren(session),
        ),
        'myDrivers': _i1.MethodConnector(
          name: 'myDrivers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i5.ProfileEndpoint)
                  .myDrivers(session),
        ),
        'myDriverProfile': _i1.MethodConnector(
          name: 'myDriverProfile',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i5.ProfileEndpoint)
                  .myDriverProfile(session),
        ),
      },
    );
    connectors['rides'] = _i1.EndpointConnector(
      name: 'rides',
      endpoint: endpoints['rides']!,
      methodConnectors: {
        'today': _i1.MethodConnector(
          name: 'today',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['rides'] as _i6.RidesEndpoint).today(session),
        ),
        'tomorrow': _i1.MethodConnector(
          name: 'tomorrow',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['rides'] as _i6.RidesEndpoint).tomorrow(session),
        ),
        'confirm': _i1.MethodConnector(
          name: 'confirm',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rides'] as _i6.RidesEndpoint).confirm(
                session,
                params['rideId'],
              ),
        ),
        'decline': _i1.MethodConnector(
          name: 'decline',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rides'] as _i6.RidesEndpoint).decline(
                session,
                params['rideId'],
                params['reason'],
              ),
        ),
        'submitEvent': _i1.MethodConnector(
          name: 'submitEvent',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'submission': _i1.ParameterDescription(
              name: 'submission',
              type: _i1.getType<_i15.RideEventSubmission>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rides'] as _i6.RidesEndpoint).submitEvent(
                session,
                params['rideId'],
                params['submission'],
              ),
        ),
        'pushLocations': _i1.MethodConnector(
          name: 'pushLocations',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'points': _i1.ParameterDescription(
              name: 'points',
              type: _i1.getType<List<_i16.RideLocationPoint>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['rides'] as _i6.RidesEndpoint).pushLocations(
                    session,
                    params['rideId'],
                    params['points'],
                  ),
        ),
        'events': _i1.MethodConnector(
          name: 'events',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rides'] as _i6.RidesEndpoint).events(
                session,
                params['rideId'],
              ),
        ),
        'myFamilies': _i1.MethodConnector(
          name: 'myFamilies',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['rides'] as _i6.RidesEndpoint).myFamilies(session),
        ),
        'recordCashTopUp': _i1.MethodConnector(
          name: 'recordCashTopUp',
          params: {
            'familyId': _i1.ParameterDescription(
              name: 'familyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'amountTenge': _i1.ParameterDescription(
              name: 'amountTenge',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'hasSignature': _i1.ParameterDescription(
              name: 'hasSignature',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['rides'] as _i6.RidesEndpoint).recordCashTopUp(
                    session,
                    familyId: params['familyId'],
                    amountTenge: params['amountTenge'],
                    hasSignature: params['hasSignature'],
                    note: params['note'],
                  ),
        ),
        'myCashTopUps': _i1.MethodConnector(
          name: 'myCashTopUps',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rides'] as _i6.RidesEndpoint).myCashTopUps(
                session,
              ),
        ),
        'tomorrowDate': _i1.MethodConnector(
          name: 'tomorrowDate',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['rides'] as _i6.RidesEndpoint).tomorrowDate(
                session,
              ),
        ),
      },
    );
    connectors['routes'] = _i1.EndpointConnector(
      name: 'routes',
      endpoint: endpoints['routes']!,
      methodConnectors: {
        'requestRoute': _i1.MethodConnector(
          name: 'requestRoute',
          params: {
            'draft': _i1.ParameterDescription(
              name: 'draft',
              type: _i1.getType<_i17.RouteTemplate>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['routes'] as _i7.RoutesEndpoint).requestRoute(
                    session,
                    params['draft'],
                  ),
        ),
        'myRoutes': _i1.MethodConnector(
          name: 'myRoutes',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['routes'] as _i7.RoutesEndpoint).myRoutes(session),
        ),
        'rideEvents': _i1.MethodConnector(
          name: 'rideEvents',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['routes'] as _i7.RoutesEndpoint).rideEvents(
                session,
                params['rideId'],
              ),
        ),
        'rideTrack': _i1.MethodConnector(
          name: 'rideTrack',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['routes'] as _i7.RoutesEndpoint).rideTrack(
                session,
                params['rideId'],
              ),
        ),
        'myBalance': _i1.MethodConnector(
          name: 'myBalance',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['routes'] as _i7.RoutesEndpoint).myBalance(
                session,
              ),
        ),
        'myNotifications': _i1.MethodConnector(
          name: 'myNotifications',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['routes'] as _i7.RoutesEndpoint)
                  .myNotifications(session),
        ),
        'ackNotification': _i1.MethodConnector(
          name: 'ackNotification',
          params: {
            'outboxId': _i1.ParameterDescription(
              name: 'outboxId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['routes'] as _i7.RoutesEndpoint).ackNotification(
                    session,
                    params['outboxId'],
                  ),
        ),
        'institutions': _i1.MethodConnector(
          name: 'institutions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['routes'] as _i7.RoutesEndpoint)
                  .institutions(session),
        ),
        'myUpcomingRides': _i1.MethodConnector(
          name: 'myUpcomingRides',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['routes'] as _i7.RoutesEndpoint)
                  .myUpcomingRides(session),
        ),
        'watchRideLocation': _i1.MethodStreamConnector(
          name: 'watchRideLocation',
          params: {
            'rideId': _i1.ParameterDescription(
              name: 'rideId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) =>
                  (endpoints['routes'] as _i7.RoutesEndpoint).watchRideLocation(
                    session,
                    params['rideId'],
                  ),
        ),
      },
    );
    connectors['health'] = _i1.EndpointConnector(
      name: 'health',
      endpoint: endpoints['health']!,
      methodConnectors: {
        'ping': _i1.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['health'] as _i8.HealthEndpoint).ping(session),
        ),
      },
    );
  }

  @override
  _i1.FutureCallDispatch? get futureCalls {
    return _i18.FutureCalls();
  }
}
