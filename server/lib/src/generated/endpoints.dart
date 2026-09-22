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
import '../health/health_endpoint.dart' as _i6;
import 'package:child_server/src/generated/family.dart' as _i7;
import 'package:child_server/src/generated/parent.dart' as _i8;
import 'package:child_server/src/generated/child.dart' as _i9;
import 'package:child_server/src/generated/driver.dart' as _i10;
import 'package:child_server/src/generated/institution.dart' as _i11;
import 'package:child_server/src/generated/circle_rank.dart' as _i12;

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
      'health': _i6.HealthEndpoint()
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
              type: _i1.getType<_i7.Family>(),
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
              type: _i1.getType<_i8.Parent>(),
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
              type: _i1.getType<_i9.Child>(),
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
              type: _i1.getType<_i10.Driver>(),
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
              type: _i1.getType<_i11.Institution>(),
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
              type: _i1.getType<_i12.CircleRank>(),
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
                  (endpoints['health'] as _i6.HealthEndpoint).ping(session),
        ),
      },
    );
  }
}
