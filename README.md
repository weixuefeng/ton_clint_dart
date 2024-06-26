# TON CLIENT DART
It is Dart packege that provide binding to TON SDK Client library. TON SDK (TONOS Client Library) is a library written in Rust that can be dynamically linked. It provides all heavy-computation components and functions, such as TON Virtual Machine, TON Transaction Executor, ABI-related functions, boc-related functions, crypto functions. [ton_client_flutter](https://github.com/weixuefeng/ton_client_flutter)

## generate dart file

```dart
cd tools/code_generator
dart code_gen.dart
```

## Use this package as a library

### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
  ton_client_dart: ^0.1.2
```

### 2. Install it
You can install packages from the command line:
```
  $ pub get
```
Alternatively, your editor might support pub get. Check the docs for your editor to learn more.

### 3. Import it
Now in your Dart code, you can use:
```dart
  import 'package:ton_client_dart/ton_client_dart.dart'
```

## How to use

#### Configuring client
```dart
import 'package:ton_client_dart/ton_client_dart.dart'
//..
var CLIENT_DEFAULT_SETUP = {
  'network': {
    'server_address': 'http://localhost',
    'message_retries_count': 5,
    'message_processing_timeout': 40000,
    'wait_for_timeout': 40000,
    'out_of_sync_threshold': 15000,
    'access_key': ''
  },
  'crypto': {'fish_param': ''},
  'abi': {
    'message_expiration_timeout': 40000,
    'message_expiration_timeout_grow_factor': 1.5
  }
};
//..
var client = TonClient();
await client.connect(CLIENT_SETUP);
//..
await client.disconnect();
```
To initialize the client, you need to call the `TonClient.connect` function and pass the settings to it. After you have finished working with the client, you must close it with the `TonClient.disconnect` function. **Don't forget to call this functions.**

#### Output TON SDK version
```dart
  await client.connect(CLIENT_DEFAULT_SETUP);
  //..
  var result = await client.version();
  print(result.version);
  //..
  await client.disconnect();
```
#### Query collection
```dart
//..
  var query = await client.net.query_collection(ParamsOfQueryCollection(
      collection: 'accounts',
      result: 'id code',
      filter: {
        'id': {'eq': enmsg.address}
  }));
//..
```
##### Query top 3 richest accounts
```dart
//..
  var pq = ParamsOfQueryCollection(
      collection: 'accounts',
      result: 'id balance',
      limit: 3,
      order: [OrderBy(path: 'balance', direction: SortDirection.DESC())]
  );
//..
```

#### Execute getmethod and returns data from TVM stack
```dart
//..
   final code = await File('./test/files/run_get_code.txt').readAsString();
   final data = await File('./test/files/run_get_data.txt').readAsString();

   final res = await client.abi.encode_account(ParamsOfEncodeAccount(
    state_init: StateInitSource_StateInit(code: code, data: data)));

   final adr = await client.utils.convert_address(ParamsOfConvertAddress(
    address: res.id, output_format: AddressStringFormat_Hex()));

   var res_run_get = await client.tvm.run_get(ParamsOfRunGet(
    account: res.account, function_name: 'participant_list'));
   String result = res_run_get.output.toString();
//..
```
##### Note: see [tests](test/) for more examples.
##### Note: you can see the contract deployment procces [here](test/src/processing_net_test.dart).


## Supported Platforms
- Linux - supported :heavy_check_mark:
- Windows - supported :heavy_check_mark:
- Android - supported :heavy_check_mark: [here](https://github.com/freetonsurfer/ton_client_flutter)
- iOS - supported :heavy_check_mark: [here](https://github.com/freetonsurfer/ton_client_flutter)
- macOS support will be implemented in future or on user demand.
- Web support will be implemented in future or on user demand.

## TODO
- improve tests
- improve debot tests
- improve help documents and comments
- check memory leaks
- improve error msgs
- think about
  - helper function usage
  - query module
  - contract auto deploy and runing module
  - connect functoin with object from map param

### Android compile notes
cargo ndk --platform 21 --target x86_64-linux-android build --release

## reference
[ton_client_dart](https://github.com/freetonsurfer/ton_client_dart)
[ton_client_flutter](https://github.com/freetonsurfer/ton_client_flutter)
