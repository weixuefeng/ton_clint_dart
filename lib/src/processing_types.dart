part of 'tonsdktypes.dart';

class ProcessingErrorCode{
late String _value;
String get value => _value;
ProcessingErrorCode.MessageAlreadyExpired(){
_value = 'MessageAlreadyExpired';}
ProcessingErrorCode.MessageHasNotDestinationAddress(){
_value = 'MessageHasNotDestinationAddress';}
ProcessingErrorCode.CanNotBuildMessageCell(){
_value = 'CanNotBuildMessageCell';}
ProcessingErrorCode.FetchBlockFailed(){
_value = 'FetchBlockFailed';}
ProcessingErrorCode.SendMessageFailed(){
_value = 'SendMessageFailed';}
ProcessingErrorCode.InvalidMessageBoc(){
_value = 'InvalidMessageBoc';}
ProcessingErrorCode.MessageExpired(){
_value = 'MessageExpired';}
ProcessingErrorCode.TransactionWaitTimeout(){
_value = 'TransactionWaitTimeout';}
ProcessingErrorCode.InvalidBlockReceived(){
_value = 'InvalidBlockReceived';}
ProcessingErrorCode.CanNotCheckBlockShard(){
_value = 'CanNotCheckBlockShard';}
ProcessingErrorCode.BlockNotFound(){
_value = 'BlockNotFound';}
ProcessingErrorCode.InvalidData(){
_value = 'InvalidData';}
ProcessingErrorCode.ExternalSignerMustNotBeUsed(){
_value = 'ExternalSignerMustNotBeUsed';}
ProcessingErrorCode.MessageRejected(){
_value = 'MessageRejected';}
ProcessingErrorCode.InvalidRempStatus(){
_value = 'InvalidRempStatus';}
ProcessingErrorCode.NextRempStatusTimeout(){
_value = 'NextRempStatusTimeout';}
@override String toString() {return '"$_value"';}
ProcessingErrorCode.fromMap(str) {_value = str;}
}
abstract class ProcessingEvent extends TonSdkStructure{
static ProcessingEvent fromMap(Map<String,dynamic> map){
if (map['type']=='WillFetchFirstBlock'){
return ProcessingEvent_WillFetchFirstBlock.fromMap(map);
}
if (map['type']=='FetchFirstBlockFailed'){
return ProcessingEvent_FetchFirstBlockFailed.fromMap(map);
}
if (map['type']=='WillSend'){
return ProcessingEvent_WillSend.fromMap(map);
}
if (map['type']=='DidSend'){
return ProcessingEvent_DidSend.fromMap(map);
}
if (map['type']=='SendFailed'){
return ProcessingEvent_SendFailed.fromMap(map);
}
if (map['type']=='WillFetchNextBlock'){
return ProcessingEvent_WillFetchNextBlock.fromMap(map);
}
if (map['type']=='FetchNextBlockFailed'){
return ProcessingEvent_FetchNextBlockFailed.fromMap(map);
}
if (map['type']=='MessageExpired'){
return ProcessingEvent_MessageExpired.fromMap(map);
}
if (map['type']=='RempSentToValidators'){
return ProcessingEvent_RempSentToValidators.fromMap(map);
}
if (map['type']=='RempIncludedIntoBlock'){
return ProcessingEvent_RempIncludedIntoBlock.fromMap(map);
}
if (map['type']=='RempIncludedIntoAcceptedBlock'){
return ProcessingEvent_RempIncludedIntoAcceptedBlock.fromMap(map);
}
if (map['type']=='RempOther'){
return ProcessingEvent_RempOther.fromMap(map);
}
if (map['type']=='RempError'){
return ProcessingEvent_RempError.fromMap(map);
}
throw('ProcessingEvent unknown from map type');
}
}

///Fetched block will be used later in waiting phase.
class ProcessingEvent_WillFetchFirstBlock extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
ProcessingEvent_WillFetchFirstBlock({required String message_id,required String message_dst,}){

_type = 'WillFetchFirstBlock';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_WillFetchFirstBlock message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_WillFetchFirstBlock message_dst');
}
ProcessingEvent_WillFetchFirstBlock.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'WillFetchFirstBlock'){throw('Wrong map data');}else{_type = 'WillFetchFirstBlock';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
map['type'] = _type;return map;
}
}

///This may happen due to the network issues. Receiving this event means that message processing will not proceed -
///message was not sent, and Developer can try to run `process_message` again,
///in the hope that the connection is restored.
class ProcessingEvent_FetchFirstBlockFailed extends ProcessingEvent{
late String? _type;
String? get type => _type;
late ClientError? _error;
ClientError? get error => _error;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
ProcessingEvent_FetchFirstBlockFailed({required ClientError error,required String message_id,required String message_dst,}){

_type = 'FetchFirstBlockFailed';
_error = ArgumentError.checkNotNull(error, 'ProcessingEvent_FetchFirstBlockFailed error');
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_FetchFirstBlockFailed message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_FetchFirstBlockFailed message_dst');
}
ProcessingEvent_FetchFirstBlockFailed.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'FetchFirstBlockFailed'){throw('Wrong map data');}else{_type = 'FetchFirstBlockFailed';}
if (map.containsKey('error')&&(map['error']!=null)) {_error = ClientError.fromMap(map['error']);}else{throw('Wrong map data');}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_error!=null) {map['error'] = _error;}
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
map['type'] = _type;return map;
}
}

///Notifies the app that the message will be sent to the network. This event means that the account's current shard block was successfully fetched and the message was successfully created (`abi.encode_message` function was executed successfully).
class ProcessingEvent_WillSend extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late String? _message;
String? get message => _message;
ProcessingEvent_WillSend({required String shard_block_id,required String message_id,required String message_dst,required String message,}){

_type = 'WillSend';
_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ProcessingEvent_WillSend shard_block_id');
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_WillSend message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_WillSend message_dst');
_message = ArgumentError.checkNotNull(message, 'ProcessingEvent_WillSend message');
}
ProcessingEvent_WillSend.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'WillSend'){throw('Wrong map data');}else{_type = 'WillSend';}
if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_message!=null) {map['message'] = _message;}
map['type'] = _type;return map;
}
}

///Do not forget to specify abi of your contract as well, it is crucial for processing. See `processing.wait_for_transaction` documentation.
class ProcessingEvent_DidSend extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late String? _message;
String? get message => _message;
ProcessingEvent_DidSend({required String shard_block_id,required String message_id,required String message_dst,required String message,}){

_type = 'DidSend';
_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ProcessingEvent_DidSend shard_block_id');
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_DidSend message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_DidSend message_dst');
_message = ArgumentError.checkNotNull(message, 'ProcessingEvent_DidSend message');
}
ProcessingEvent_DidSend.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'DidSend'){throw('Wrong map data');}else{_type = 'DidSend';}
if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_message!=null) {map['message'] = _message;}
map['type'] = _type;return map;
}
}

///Nevertheless the processing will be continued at the waiting
///phase because the message possibly has been delivered to the
///node.
///If Application exits at this phase, Developer needs to proceed with processing
///after the application is restored with `wait_for_transaction` function, passing
///shard_block_id and message from this event. Do not forget to specify abi of your contract
///as well, it is crucial for processing. See `processing.wait_for_transaction` documentation.
class ProcessingEvent_SendFailed extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late String? _message;
String? get message => _message;
late ClientError? _error;
ClientError? get error => _error;
ProcessingEvent_SendFailed({required String shard_block_id,required String message_id,required String message_dst,required String message,required ClientError error,}){

_type = 'SendFailed';
_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ProcessingEvent_SendFailed shard_block_id');
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_SendFailed message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_SendFailed message_dst');
_message = ArgumentError.checkNotNull(message, 'ProcessingEvent_SendFailed message');
_error = ArgumentError.checkNotNull(error, 'ProcessingEvent_SendFailed error');
}
ProcessingEvent_SendFailed.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'SendFailed'){throw('Wrong map data');}else{_type = 'SendFailed';}
if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('error')&&(map['error']!=null)) {_error = ClientError.fromMap(map['error']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_message!=null) {map['message'] = _message;}
if (_error!=null) {map['error'] = _error;}
map['type'] = _type;return map;
}
}

///Event can occurs more than one time due to block walking
///procedure.
///If Application exits at this phase, Developer needs to proceed with processing
///after the application is restored with `wait_for_transaction` function, passing
///shard_block_id and message from this event. Do not forget to specify abi of your contract
///as well, it is crucial for processing. See `processing.wait_for_transaction` documentation.
class ProcessingEvent_WillFetchNextBlock extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late String? _message;
String? get message => _message;
ProcessingEvent_WillFetchNextBlock({required String shard_block_id,required String message_id,required String message_dst,required String message,}){

_type = 'WillFetchNextBlock';
_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ProcessingEvent_WillFetchNextBlock shard_block_id');
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_WillFetchNextBlock message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_WillFetchNextBlock message_dst');
_message = ArgumentError.checkNotNull(message, 'ProcessingEvent_WillFetchNextBlock message');
}
ProcessingEvent_WillFetchNextBlock.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'WillFetchNextBlock'){throw('Wrong map data');}else{_type = 'WillFetchNextBlock';}
if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_message!=null) {map['message'] = _message;}
map['type'] = _type;return map;
}
}

///If no block was fetched within `NetworkConfig.wait_for_timeout` then processing stops.
///This may happen when the shard stops, or there are other network issues.
///In this case Developer should resume message processing with `wait_for_transaction`, passing shard_block_id,
///message and contract abi to it. Note that passing ABI is crucial, because it will influence the processing strategy.
///
///Another way to tune this is to specify long timeout in `NetworkConfig.wait_for_timeout`
class ProcessingEvent_FetchNextBlockFailed extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late String? _message;
String? get message => _message;
late ClientError? _error;
ClientError? get error => _error;
ProcessingEvent_FetchNextBlockFailed({required String shard_block_id,required String message_id,required String message_dst,required String message,required ClientError error,}){

_type = 'FetchNextBlockFailed';
_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ProcessingEvent_FetchNextBlockFailed shard_block_id');
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_FetchNextBlockFailed message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_FetchNextBlockFailed message_dst');
_message = ArgumentError.checkNotNull(message, 'ProcessingEvent_FetchNextBlockFailed message');
_error = ArgumentError.checkNotNull(error, 'ProcessingEvent_FetchNextBlockFailed error');
}
ProcessingEvent_FetchNextBlockFailed.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'FetchNextBlockFailed'){throw('Wrong map data');}else{_type = 'FetchNextBlockFailed';}
if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('error')&&(map['error']!=null)) {_error = ClientError.fromMap(map['error']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_message!=null) {map['message'] = _message;}
if (_error!=null) {map['error'] = _error;}
map['type'] = _type;return map;
}
}

///This event occurs only for the contracts which ABI includes "expire" header.
///
///If Application specifies `NetworkConfig.message_retries_count` > 0, then `process_message`
///will perform retries: will create a new message and send it again and repeat it until it reaches
///the maximum retries count or receives a successful result.  All the processing
///events will be repeated.
class ProcessingEvent_MessageExpired extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late String? _message;
String? get message => _message;
late ClientError? _error;
ClientError? get error => _error;
ProcessingEvent_MessageExpired({required String message_id,required String message_dst,required String message,required ClientError error,}){

_type = 'MessageExpired';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_MessageExpired message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_MessageExpired message_dst');
_message = ArgumentError.checkNotNull(message, 'ProcessingEvent_MessageExpired message');
_error = ArgumentError.checkNotNull(error, 'ProcessingEvent_MessageExpired error');
}
ProcessingEvent_MessageExpired.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'MessageExpired'){throw('Wrong map data');}else{_type = 'MessageExpired';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('error')&&(map['error']!=null)) {_error = ClientError.fromMap(map['error']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_message!=null) {map['message'] = _message;}
if (_error!=null) {map['error'] = _error;}
map['type'] = _type;return map;
}
}

///Notifies the app that the message has been delivered to the thread's validators
class ProcessingEvent_RempSentToValidators extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late BigInt? _timestamp;
BigInt? get timestamp => _timestamp;
late dynamic? _json;
dynamic? get json => _json;
ProcessingEvent_RempSentToValidators({required String message_id,required String message_dst,required BigInt timestamp,required dynamic json,}){

_type = 'RempSentToValidators';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_RempSentToValidators message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_RempSentToValidators message_dst');
_timestamp = ArgumentError.checkNotNull(timestamp, 'ProcessingEvent_RempSentToValidators timestamp');
_json = ArgumentError.checkNotNull(json, 'ProcessingEvent_RempSentToValidators json');
}
ProcessingEvent_RempSentToValidators.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'RempSentToValidators'){throw('Wrong map data');}else{_type = 'RempSentToValidators';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('timestamp')&&(map['timestamp']!=null)) {_timestamp = BigInt.from(map['timestamp']);}else{throw('Wrong map data');}
if (map.containsKey('json')&&(map['json']!=null)) {_json = map['json'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_timestamp!=null) {map['timestamp'] = _timestamp;}
if (_json!=null) {map['json'] = _json;}
map['type'] = _type;return map;
}
}

///Notifies the app that the message has been successfully included into a block candidate by the thread's collator
class ProcessingEvent_RempIncludedIntoBlock extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late BigInt? _timestamp;
BigInt? get timestamp => _timestamp;
late dynamic? _json;
dynamic? get json => _json;
ProcessingEvent_RempIncludedIntoBlock({required String message_id,required String message_dst,required BigInt timestamp,required dynamic json,}){

_type = 'RempIncludedIntoBlock';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_RempIncludedIntoBlock message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_RempIncludedIntoBlock message_dst');
_timestamp = ArgumentError.checkNotNull(timestamp, 'ProcessingEvent_RempIncludedIntoBlock timestamp');
_json = ArgumentError.checkNotNull(json, 'ProcessingEvent_RempIncludedIntoBlock json');
}
ProcessingEvent_RempIncludedIntoBlock.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'RempIncludedIntoBlock'){throw('Wrong map data');}else{_type = 'RempIncludedIntoBlock';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('timestamp')&&(map['timestamp']!=null)) {_timestamp = BigInt.from(map['timestamp']);}else{throw('Wrong map data');}
if (map.containsKey('json')&&(map['json']!=null)) {_json = map['json'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_timestamp!=null) {map['timestamp'] = _timestamp;}
if (_json!=null) {map['json'] = _json;}
map['type'] = _type;return map;
}
}

///Notifies the app that the block candidate with the message has been accepted by the thread's validators
class ProcessingEvent_RempIncludedIntoAcceptedBlock extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late BigInt? _timestamp;
BigInt? get timestamp => _timestamp;
late dynamic? _json;
dynamic? get json => _json;
ProcessingEvent_RempIncludedIntoAcceptedBlock({required String message_id,required String message_dst,required BigInt timestamp,required dynamic json,}){

_type = 'RempIncludedIntoAcceptedBlock';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_RempIncludedIntoAcceptedBlock message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_RempIncludedIntoAcceptedBlock message_dst');
_timestamp = ArgumentError.checkNotNull(timestamp, 'ProcessingEvent_RempIncludedIntoAcceptedBlock timestamp');
_json = ArgumentError.checkNotNull(json, 'ProcessingEvent_RempIncludedIntoAcceptedBlock json');
}
ProcessingEvent_RempIncludedIntoAcceptedBlock.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'RempIncludedIntoAcceptedBlock'){throw('Wrong map data');}else{_type = 'RempIncludedIntoAcceptedBlock';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('timestamp')&&(map['timestamp']!=null)) {_timestamp = BigInt.from(map['timestamp']);}else{throw('Wrong map data');}
if (map.containsKey('json')&&(map['json']!=null)) {_json = map['json'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_timestamp!=null) {map['timestamp'] = _timestamp;}
if (_json!=null) {map['json'] = _json;}
map['type'] = _type;return map;
}
}

///Notifies the app about some other minor REMP statuses occurring during message processing
class ProcessingEvent_RempOther extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late BigInt? _timestamp;
BigInt? get timestamp => _timestamp;
late dynamic? _json;
dynamic? get json => _json;
ProcessingEvent_RempOther({required String message_id,required String message_dst,required BigInt timestamp,required dynamic json,}){

_type = 'RempOther';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_RempOther message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_RempOther message_dst');
_timestamp = ArgumentError.checkNotNull(timestamp, 'ProcessingEvent_RempOther timestamp');
_json = ArgumentError.checkNotNull(json, 'ProcessingEvent_RempOther json');
}
ProcessingEvent_RempOther.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'RempOther'){throw('Wrong map data');}else{_type = 'RempOther';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('timestamp')&&(map['timestamp']!=null)) {_timestamp = BigInt.from(map['timestamp']);}else{throw('Wrong map data');}
if (map.containsKey('json')&&(map['json']!=null)) {_json = map['json'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_timestamp!=null) {map['timestamp'] = _timestamp;}
if (_json!=null) {map['json'] = _json;}
map['type'] = _type;return map;
}
}

///Notifies the app about any problem that has occurred in REMP processing - in this case library switches to the fallback transaction awaiting scenario (sequential block reading).
class ProcessingEvent_RempError extends ProcessingEvent{
late String? _type;
String? get type => _type;
late String? _message_id;
String? get message_id => _message_id;
late String? _message_dst;
String? get message_dst => _message_dst;
late ClientError? _error;
ClientError? get error => _error;
ProcessingEvent_RempError({required String message_id,required String message_dst,required ClientError error,}){

_type = 'RempError';
_message_id = ArgumentError.checkNotNull(message_id, 'ProcessingEvent_RempError message_id');
_message_dst = ArgumentError.checkNotNull(message_dst, 'ProcessingEvent_RempError message_dst');
_error = ArgumentError.checkNotNull(error, 'ProcessingEvent_RempError error');
}
ProcessingEvent_RempError.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'RempError'){throw('Wrong map data');}else{_type = 'RempError';}
if (map.containsKey('message_id')&&(map['message_id']!=null)) {_message_id = map['message_id'];}else{throw('Wrong map data');}
if (map.containsKey('message_dst')&&(map['message_dst']!=null)) {_message_dst = map['message_dst'];}else{throw('Wrong map data');}
if (map.containsKey('error')&&(map['error']!=null)) {_error = ClientError.fromMap(map['error']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_id!=null) {map['message_id'] = _message_id;}
if (_message_dst!=null) {map['message_dst'] = _message_dst;}
if (_error!=null) {map['error'] = _error;}
map['type'] = _type;return map;
}
}

class ResultOfProcessMessage extends TonSdkStructure{
///In addition to the regular transaction fields there is a
///`boc` field encoded with `base64` which contains source
///transaction BOC.
late dynamic? _transaction;
dynamic? get transaction => _transaction;
///Encoded as `base64`
late List<String>? _out_messages;
List<String>? get out_messages => _out_messages;
///Optional decoded message bodies according to the optional `abi` parameter.
late DecodedOutput? _decoded;
DecodedOutput? get decoded => _decoded;
///Transaction fees
late TransactionFees? _fees;
TransactionFees? get fees => _fees;
ResultOfProcessMessage({required dynamic transaction,required List<String> out_messages,DecodedOutput? decoded,required TransactionFees fees,}){

_transaction = ArgumentError.checkNotNull(transaction, 'ResultOfProcessMessage transaction');
_out_messages = ArgumentError.checkNotNull(out_messages, 'ResultOfProcessMessage out_messages');
_decoded = decoded;
_fees = ArgumentError.checkNotNull(fees, 'ResultOfProcessMessage fees');
}
ResultOfProcessMessage.fromMap(Map<String,dynamic> map){if (map.containsKey('transaction')&&(map['transaction']!=null)) {_transaction = map['transaction'];}else{throw('Wrong map data');}
if (map.containsKey('out_messages')&&(map['out_messages']!=null)) {_out_messages = [];
for (var el in map['out_messages']) {
if (el != null) {_out_messages?.add(el);}else {}}}else{throw('Wrong map data');}
if (map.containsKey('decoded')&&(map['decoded']!=null)) {_decoded = DecodedOutput.fromMap(map['decoded']);}
if (map.containsKey('fees')&&(map['fees']!=null)) {_fees = TransactionFees.fromMap(map['fees']);}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_transaction!=null) {map['transaction'] = _transaction;}
if (_out_messages!=null) {map['out_messages'] = _out_messages;}
if (_decoded!=null) {map['decoded'] = _decoded;}
if (_fees!=null) {map['fees'] = _fees;}
return map;
}
}

class DecodedOutput extends TonSdkStructure{
///If the message can't be decoded, then `None` will be stored in
///the appropriate position.
late List<DecodedMessageBody>? _out_messages;
List<DecodedMessageBody>? get out_messages => _out_messages;
///Decoded body of the function output message.
late dynamic? _output;
dynamic? get output => _output;
DecodedOutput({required List<DecodedMessageBody> out_messages,dynamic? output,}){

_out_messages = ArgumentError.checkNotNull(out_messages, 'DecodedOutput out_messages');
_output = output;
}
DecodedOutput.fromMap(Map<String,dynamic> map){if (map.containsKey('out_messages')&&(map['out_messages']!=null)) {_out_messages = [];
for (var el in map['out_messages']) {
if (el != null) {_out_messages?.add(DecodedMessageBody.fromMap(el));}else {}}}else{throw('Wrong map data');}
if (map.containsKey('output')&&(map['output']!=null)) {_output = map['output'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_out_messages!=null) {map['out_messages'] = _out_messages;}
if (_output!=null) {map['output'] = _output;}
return map;
}
}

class MessageMonitoringTransactionCompute extends TonSdkStructure{
///Compute phase exit code.
late int? _exit_code;
int? get exit_code => _exit_code;
MessageMonitoringTransactionCompute({required int exit_code,}){

_exit_code = ArgumentError.checkNotNull(exit_code, 'MessageMonitoringTransactionCompute exit_code');
}
MessageMonitoringTransactionCompute.fromMap(Map<String,dynamic> map){if (map.containsKey('exit_code')&&(map['exit_code']!=null)) {_exit_code = map['exit_code'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_exit_code!=null) {map['exit_code'] = _exit_code;}
return map;
}
}

class MessageMonitoringTransaction extends TonSdkStructure{
///Hash of the transaction. Present if transaction was included into the blocks. When then transaction was emulated this field will be missing.
late String? _hash;
String? get hash => _hash;
///Aborted field of the transaction.
late bool? _aborted;
bool? get aborted => _aborted;
///Optional information about the compute phase of the transaction.
late MessageMonitoringTransactionCompute? _compute;
MessageMonitoringTransactionCompute? get compute => _compute;
MessageMonitoringTransaction({String? hash,required bool aborted,MessageMonitoringTransactionCompute? compute,}){

_hash = hash;
_aborted = ArgumentError.checkNotNull(aborted, 'MessageMonitoringTransaction aborted');
_compute = compute;
}
MessageMonitoringTransaction.fromMap(Map<String,dynamic> map){if (map.containsKey('hash')&&(map['hash']!=null)) {_hash = map['hash'];}
if (map.containsKey('aborted')&&(map['aborted']!=null)) {_aborted = map['aborted'];}else{throw('Wrong map data');}
if (map.containsKey('compute')&&(map['compute']!=null)) {_compute = MessageMonitoringTransactionCompute.fromMap(map['compute']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_hash!=null) {map['hash'] = _hash;}
if (_aborted!=null) {map['aborted'] = _aborted;}
if (_compute!=null) {map['compute'] = _compute;}
return map;
}
}

class MessageMonitoringParams extends TonSdkStructure{
///Monitored message identification. Can be provided as a message's BOC or (hash, address) pair. BOC is a preferable way because it helps to determine possible error reason (using TVM execution of the message).
late MonitoredMessage? _message;
MonitoredMessage? get message => _message;
///Block time Must be specified as a UNIX timestamp in seconds
late int? _wait_until;
int? get wait_until => _wait_until;
///User defined data associated with this message. Helps to identify this message when user received `MessageMonitoringResult`.
late dynamic? _user_data;
dynamic? get user_data => _user_data;
MessageMonitoringParams({required MonitoredMessage message,required int wait_until,dynamic? user_data,}){

_message = ArgumentError.checkNotNull(message, 'MessageMonitoringParams message');
_wait_until = ArgumentError.checkNotNull(wait_until, 'MessageMonitoringParams wait_until');
_user_data = user_data;
}
MessageMonitoringParams.fromMap(Map<String,dynamic> map){if (map.containsKey('message')&&(map['message']!=null)) {_message = MonitoredMessage.fromMap(map['message']);}else{throw('Wrong map data');}
if (map.containsKey('wait_until')&&(map['wait_until']!=null)) {_wait_until = map['wait_until'];}else{throw('Wrong map data');}
if (map.containsKey('user_data')&&(map['user_data']!=null)) {_user_data = map['user_data'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message!=null) {map['message'] = _message;}
if (_wait_until!=null) {map['wait_until'] = _wait_until;}
if (_user_data!=null) {map['user_data'] = _user_data;}
return map;
}
}

class MessageMonitoringResult extends TonSdkStructure{
///Hash of the message.
late String? _hash;
String? get hash => _hash;
///Processing status.
late MessageMonitoringStatus? _status;
MessageMonitoringStatus? get status => _status;
///In case of `Finalized` the transaction is extracted from the block. In case of `Timeout` the transaction is emulated using the last known account state.
late MessageMonitoringTransaction? _transaction;
MessageMonitoringTransaction? get transaction => _transaction;
///In case of `Timeout` contains possible error reason.
late String? _error;
String? get error => _error;
///User defined data related to this message. This is the same value as passed before with `MessageMonitoringParams` or `SendMessageParams`.
late dynamic? _user_data;
dynamic? get user_data => _user_data;
MessageMonitoringResult({required String hash,required MessageMonitoringStatus status,MessageMonitoringTransaction? transaction,String? error,dynamic? user_data,}){

_hash = ArgumentError.checkNotNull(hash, 'MessageMonitoringResult hash');
_status = ArgumentError.checkNotNull(status, 'MessageMonitoringResult status');
_transaction = transaction;
_error = error;
_user_data = user_data;
}
MessageMonitoringResult.fromMap(Map<String,dynamic> map){if (map.containsKey('hash')&&(map['hash']!=null)) {_hash = map['hash'];}else{throw('Wrong map data');}
if (map.containsKey('status')&&(map['status']!=null)) {_status = MessageMonitoringStatus.fromMap(map['status']);}else{throw('Wrong map data');}
if (map.containsKey('transaction')&&(map['transaction']!=null)) {_transaction = MessageMonitoringTransaction.fromMap(map['transaction']);}
if (map.containsKey('error')&&(map['error']!=null)) {_error = map['error'];}
if (map.containsKey('user_data')&&(map['user_data']!=null)) {_user_data = map['user_data'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_hash!=null) {map['hash'] = _hash;}
if (_status!=null) {map['status'] = _status;}
if (_transaction!=null) {map['transaction'] = _transaction;}
if (_error!=null) {map['error'] = _error;}
if (_user_data!=null) {map['user_data'] = _user_data;}
return map;
}
}

class MonitorFetchWaitMode{
late String _value;
String get value => _value;
///If there are no resolved results yet, then monitor awaits for the next resolved result.
MonitorFetchWaitMode.AtLeastOne(){
_value = 'AtLeastOne';}
///Monitor waits until all unresolved messages will be resolved. If there are no unresolved messages then monitor will wait.
MonitorFetchWaitMode.All(){
_value = 'All';}
MonitorFetchWaitMode.NoWait(){
_value = 'NoWait';}
@override String toString() {return '"$_value"';}
MonitorFetchWaitMode.fromMap(str) {_value = str;}
}
abstract class MonitoredMessage extends TonSdkStructure{
static MonitoredMessage fromMap(Map<String,dynamic> map){
if (map['type']=='Boc'){
return MonitoredMessage_Boc.fromMap(map);
}
if (map['type']=='HashAddress'){
return MonitoredMessage_HashAddress.fromMap(map);
}
throw('MonitoredMessage unknown from map type');
}
}

///BOC of the message.
class MonitoredMessage_Boc extends MonitoredMessage{
late String? _type;
String? get type => _type;
late String? _boc;
String? get boc => _boc;
MonitoredMessage_Boc({required String boc,}){

_type = 'Boc';
_boc = ArgumentError.checkNotNull(boc, 'MonitoredMessage_Boc boc');
}
MonitoredMessage_Boc.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'Boc'){throw('Wrong map data');}else{_type = 'Boc';}
if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
map['type'] = _type;return map;
}
}

///Message's hash and destination address.
class MonitoredMessage_HashAddress extends MonitoredMessage{
late String? _type;
String? get type => _type;
///Hash of the message.
late String? _hash;
String? get hash => _hash;
///Destination address of the message.
late String? _address;
String? get address => _address;
MonitoredMessage_HashAddress({required String hash,required String address,}){

_type = 'HashAddress';
_hash = ArgumentError.checkNotNull(hash, 'MonitoredMessage_HashAddress hash');
_address = ArgumentError.checkNotNull(address, 'MonitoredMessage_HashAddress address');
}
MonitoredMessage_HashAddress.fromMap(Map<String,dynamic> map){if (!map.containsKey('type') || map['type']!= 'HashAddress'){throw('Wrong map data');}else{_type = 'HashAddress';}
if (map.containsKey('hash')&&(map['hash']!=null)) {_hash = map['hash'];}else{throw('Wrong map data');}
if (map.containsKey('address')&&(map['address']!=null)) {_address = map['address'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_hash!=null) {map['hash'] = _hash;}
if (_address!=null) {map['address'] = _address;}
map['type'] = _type;return map;
}
}

class MessageMonitoringStatus{
late String _value;
String get value => _value;
///Returned when the messages was processed and included into finalized block before `wait_until` block time.
MessageMonitoringStatus.Finalized(){
_value = 'Finalized';}
///Returned when the message was not processed until `wait_until` block time.
MessageMonitoringStatus.Timeout(){
_value = 'Timeout';}
///Is never returned. Application should wait for one of the `Finalized` or `Timeout` statuses.
///All other statuses are intermediate.
MessageMonitoringStatus.Reserved(){
_value = 'Reserved';}
@override String toString() {return '"$_value"';}
MessageMonitoringStatus.fromMap(str) {_value = str;}
}
class MessageSendingParams extends TonSdkStructure{
///BOC of the message, that must be sent to the blockchain.
late String? _boc;
String? get boc => _boc;
///Expiration time of the message. Must be specified as a UNIX timestamp in seconds.
late int? _wait_until;
int? get wait_until => _wait_until;
///User defined data associated with this message. Helps to identify this message when user received `MessageMonitoringResult`.
late dynamic? _user_data;
dynamic? get user_data => _user_data;
MessageSendingParams({required String boc,required int wait_until,dynamic? user_data,}){

_boc = ArgumentError.checkNotNull(boc, 'MessageSendingParams boc');
_wait_until = ArgumentError.checkNotNull(wait_until, 'MessageSendingParams wait_until');
_user_data = user_data;
}
MessageSendingParams.fromMap(Map<String,dynamic> map){if (map.containsKey('boc')&&(map['boc']!=null)) {_boc = map['boc'];}else{throw('Wrong map data');}
if (map.containsKey('wait_until')&&(map['wait_until']!=null)) {_wait_until = map['wait_until'];}else{throw('Wrong map data');}
if (map.containsKey('user_data')&&(map['user_data']!=null)) {_user_data = map['user_data'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_boc!=null) {map['boc'] = _boc;}
if (_wait_until!=null) {map['wait_until'] = _wait_until;}
if (_user_data!=null) {map['user_data'] = _user_data;}
return map;
}
}

class ParamsOfMonitorMessages extends TonSdkStructure{
///Name of the monitoring queue.
late String? _queue;
String? get queue => _queue;
///Messages to start monitoring for.
late List<MessageMonitoringParams>? _messages;
List<MessageMonitoringParams>? get messages => _messages;
ParamsOfMonitorMessages({required String queue,required List<MessageMonitoringParams> messages,}){

_queue = ArgumentError.checkNotNull(queue, 'ParamsOfMonitorMessages queue');
_messages = ArgumentError.checkNotNull(messages, 'ParamsOfMonitorMessages messages');
}
ParamsOfMonitorMessages.fromMap(Map<String,dynamic> map){if (map.containsKey('queue')&&(map['queue']!=null)) {_queue = map['queue'];}else{throw('Wrong map data');}
if (map.containsKey('messages')&&(map['messages']!=null)) {_messages = [];
for (var el in map['messages']) {
if (el != null) {_messages?.add(MessageMonitoringParams.fromMap(el));}else {}}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_queue!=null) {map['queue'] = _queue;}
if (_messages!=null) {map['messages'] = _messages;}
return map;
}
}

class ParamsOfGetMonitorInfo extends TonSdkStructure{
///Name of the monitoring queue.
late String? _queue;
String? get queue => _queue;
ParamsOfGetMonitorInfo({required String queue,}){

_queue = ArgumentError.checkNotNull(queue, 'ParamsOfGetMonitorInfo queue');
}
ParamsOfGetMonitorInfo.fromMap(Map<String,dynamic> map){if (map.containsKey('queue')&&(map['queue']!=null)) {_queue = map['queue'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_queue!=null) {map['queue'] = _queue;}
return map;
}
}

class MonitoringQueueInfo extends TonSdkStructure{
///Count of the unresolved messages.
late int? _unresolved;
int? get unresolved => _unresolved;
///Count of resolved results.
late int? _resolved;
int? get resolved => _resolved;
MonitoringQueueInfo({required int unresolved,required int resolved,}){

_unresolved = ArgumentError.checkNotNull(unresolved, 'MonitoringQueueInfo unresolved');
_resolved = ArgumentError.checkNotNull(resolved, 'MonitoringQueueInfo resolved');
}
MonitoringQueueInfo.fromMap(Map<String,dynamic> map){if (map.containsKey('unresolved')&&(map['unresolved']!=null)) {_unresolved = map['unresolved'];}else{throw('Wrong map data');}
if (map.containsKey('resolved')&&(map['resolved']!=null)) {_resolved = map['resolved'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_unresolved!=null) {map['unresolved'] = _unresolved;}
if (_resolved!=null) {map['resolved'] = _resolved;}
return map;
}
}

class ParamsOfFetchNextMonitorResults extends TonSdkStructure{
///Name of the monitoring queue.
late String? _queue;
String? get queue => _queue;
///Default is `NO_WAIT`.
late MonitorFetchWaitMode? _wait_mode;
MonitorFetchWaitMode? get wait_mode => _wait_mode;
ParamsOfFetchNextMonitorResults({required String queue,MonitorFetchWaitMode? wait_mode,}){

_queue = ArgumentError.checkNotNull(queue, 'ParamsOfFetchNextMonitorResults queue');
_wait_mode = wait_mode;
}
ParamsOfFetchNextMonitorResults.fromMap(Map<String,dynamic> map){if (map.containsKey('queue')&&(map['queue']!=null)) {_queue = map['queue'];}else{throw('Wrong map data');}
if (map.containsKey('wait_mode')&&(map['wait_mode']!=null)) {_wait_mode = MonitorFetchWaitMode.fromMap(map['wait_mode']);}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_queue!=null) {map['queue'] = _queue;}
if (_wait_mode!=null) {map['wait_mode'] = _wait_mode;}
return map;
}
}

class ResultOfFetchNextMonitorResults extends TonSdkStructure{
///List of the resolved results.
late List<MessageMonitoringResult>? _results;
List<MessageMonitoringResult>? get results => _results;
ResultOfFetchNextMonitorResults({required List<MessageMonitoringResult> results,}){

_results = ArgumentError.checkNotNull(results, 'ResultOfFetchNextMonitorResults results');
}
ResultOfFetchNextMonitorResults.fromMap(Map<String,dynamic> map){if (map.containsKey('results')&&(map['results']!=null)) {_results = [];
for (var el in map['results']) {
if (el != null) {_results?.add(MessageMonitoringResult.fromMap(el));}else {}}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_results!=null) {map['results'] = _results;}
return map;
}
}

class ParamsOfCancelMonitor extends TonSdkStructure{
///Name of the monitoring queue.
late String? _queue;
String? get queue => _queue;
ParamsOfCancelMonitor({required String queue,}){

_queue = ArgumentError.checkNotNull(queue, 'ParamsOfCancelMonitor queue');
}
ParamsOfCancelMonitor.fromMap(Map<String,dynamic> map){if (map.containsKey('queue')&&(map['queue']!=null)) {_queue = map['queue'];}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_queue!=null) {map['queue'] = _queue;}
return map;
}
}

class ParamsOfSendMessages extends TonSdkStructure{
///Messages that must be sent to the blockchain.
late List<MessageSendingParams>? _messages;
List<MessageSendingParams>? get messages => _messages;
///Optional message monitor queue that starts monitoring for the processing results for sent messages.
late String? _monitor_queue;
String? get monitor_queue => _monitor_queue;
ParamsOfSendMessages({required List<MessageSendingParams> messages,String? monitor_queue,}){

_messages = ArgumentError.checkNotNull(messages, 'ParamsOfSendMessages messages');
_monitor_queue = monitor_queue;
}
ParamsOfSendMessages.fromMap(Map<String,dynamic> map){if (map.containsKey('messages')&&(map['messages']!=null)) {_messages = [];
for (var el in map['messages']) {
if (el != null) {_messages?.add(MessageSendingParams.fromMap(el));}else {}}}else{throw('Wrong map data');}
if (map.containsKey('monitor_queue')&&(map['monitor_queue']!=null)) {_monitor_queue = map['monitor_queue'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_messages!=null) {map['messages'] = _messages;}
if (_monitor_queue!=null) {map['monitor_queue'] = _monitor_queue;}
return map;
}
}

class ResultOfSendMessages extends TonSdkStructure{
///Messages that was sent to the blockchain for execution.
late List<MessageMonitoringParams>? _messages;
List<MessageMonitoringParams>? get messages => _messages;
ResultOfSendMessages({required List<MessageMonitoringParams> messages,}){

_messages = ArgumentError.checkNotNull(messages, 'ResultOfSendMessages messages');
}
ResultOfSendMessages.fromMap(Map<String,dynamic> map){if (map.containsKey('messages')&&(map['messages']!=null)) {_messages = [];
for (var el in map['messages']) {
if (el != null) {_messages?.add(MessageMonitoringParams.fromMap(el));}else {}}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_messages!=null) {map['messages'] = _messages;}
return map;
}
}

class ParamsOfSendMessage extends TonSdkStructure{
///Message BOC.
late String? _message;
String? get message => _message;
///If this parameter is specified and the message has the
///`expire` header then expiration time will be checked against
///the current time to prevent unnecessary sending of already expired message.
///
///The `message already expired` error will be returned in this
///case.
///
///Note, that specifying `abi` for ABI compliant contracts is
///strongly recommended, so that proper processing strategy can be
///chosen.
late Abi? _abi;
Abi? get abi => _abi;
///Flag for requesting events sending. Default is `false`.
late bool? _send_events;
bool? get send_events => _send_events;
ParamsOfSendMessage({required String message,Abi? abi,bool? send_events,}){

_message = ArgumentError.checkNotNull(message, 'ParamsOfSendMessage message');
_abi = abi;
_send_events = send_events;
}
ParamsOfSendMessage.fromMap(Map<String,dynamic> map){if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('abi')&&(map['abi']!=null)) {_abi = Abi.fromMap(map['abi']);}
if (map.containsKey('send_events')&&(map['send_events']!=null)) {_send_events = map['send_events'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message!=null) {map['message'] = _message;}
if (_abi!=null) {map['abi'] = _abi;}
if (_send_events!=null) {map['send_events'] = _send_events;}
return map;
}
}

class ResultOfSendMessage extends TonSdkStructure{
///This block id must be used as a parameter of the
///`wait_for_transaction`.
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
///This list id must be used as a parameter of the
///`wait_for_transaction`.
late List<String>? _sending_endpoints;
List<String>? get sending_endpoints => _sending_endpoints;
ResultOfSendMessage({required String shard_block_id,required List<String> sending_endpoints,}){

_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ResultOfSendMessage shard_block_id');
_sending_endpoints = ArgumentError.checkNotNull(sending_endpoints, 'ResultOfSendMessage sending_endpoints');
}
ResultOfSendMessage.fromMap(Map<String,dynamic> map){if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('sending_endpoints')&&(map['sending_endpoints']!=null)) {_sending_endpoints = [];
for (var el in map['sending_endpoints']) {
if (el != null) {_sending_endpoints?.add(el);}else {}}}else{throw('Wrong map data');}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_sending_endpoints!=null) {map['sending_endpoints'] = _sending_endpoints;}
return map;
}
}

class ParamsOfWaitForTransaction extends TonSdkStructure{
///If it is specified, then the output messages' bodies will be
///decoded according to this ABI.
///
///The `abi_decoded` result field will be filled out.
late Abi? _abi;
Abi? get abi => _abi;
///Encoded with `base64`.
late String? _message;
String? get message => _message;
///You must provide the same value as the `send_message` has returned.
late String? _shard_block_id;
String? get shard_block_id => _shard_block_id;
///Flag that enables/disables intermediate events. Default is `false`.
late bool? _send_events;
bool? get send_events => _send_events;
///Use this field to get more informative errors.
///Provide the same value as the `send_message` has returned.
///If the message was not delivered (expired), SDK will log the endpoint URLs, used for its sending.
late List<String>? _sending_endpoints;
List<String>? get sending_endpoints => _sending_endpoints;
ParamsOfWaitForTransaction({Abi? abi,required String message,required String shard_block_id,bool? send_events,List<String>? sending_endpoints,}){

_abi = abi;
_message = ArgumentError.checkNotNull(message, 'ParamsOfWaitForTransaction message');
_shard_block_id = ArgumentError.checkNotNull(shard_block_id, 'ParamsOfWaitForTransaction shard_block_id');
_send_events = send_events;
_sending_endpoints = sending_endpoints;
}
ParamsOfWaitForTransaction.fromMap(Map<String,dynamic> map){if (map.containsKey('abi')&&(map['abi']!=null)) {_abi = Abi.fromMap(map['abi']);}
if (map.containsKey('message')&&(map['message']!=null)) {_message = map['message'];}else{throw('Wrong map data');}
if (map.containsKey('shard_block_id')&&(map['shard_block_id']!=null)) {_shard_block_id = map['shard_block_id'];}else{throw('Wrong map data');}
if (map.containsKey('send_events')&&(map['send_events']!=null)) {_send_events = map['send_events'];}
if (map.containsKey('sending_endpoints')&&(map['sending_endpoints']!=null)) {_sending_endpoints = [];
for (var el in map['sending_endpoints']) {
if (el != null) {_sending_endpoints?.add(el);}else {}}}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_abi!=null) {map['abi'] = _abi;}
if (_message!=null) {map['message'] = _message;}
if (_shard_block_id!=null) {map['shard_block_id'] = _shard_block_id;}
if (_send_events!=null) {map['send_events'] = _send_events;}
if (_sending_endpoints!=null) {map['sending_endpoints'] = _sending_endpoints;}
return map;
}
}

class ParamsOfProcessMessage extends TonSdkStructure{
///Message encode parameters.
late ParamsOfEncodeMessage? _message_encode_params;
ParamsOfEncodeMessage? get message_encode_params => _message_encode_params;
///Flag for requesting events sending. Default is `false`.
late bool? _send_events;
bool? get send_events => _send_events;
ParamsOfProcessMessage({required ParamsOfEncodeMessage message_encode_params,bool? send_events,}){

_message_encode_params = ArgumentError.checkNotNull(message_encode_params, 'ParamsOfProcessMessage message_encode_params');
_send_events = send_events;
}
ParamsOfProcessMessage.fromMap(Map<String,dynamic> map){if (map.containsKey('message_encode_params')&&(map['message_encode_params']!=null)) {_message_encode_params = ParamsOfEncodeMessage.fromMap(map['message_encode_params']);}else{throw('Wrong map data');}
if (map.containsKey('send_events')&&(map['send_events']!=null)) {_send_events = map['send_events'];}
}

Map<String,dynamic> toMap(){
Map<String,dynamic> map ={};
if (_message_encode_params!=null) {map['message_encode_params'] = _message_encode_params;}
if (_send_events!=null) {map['send_events'] = _send_events;}
return map;
}
}

