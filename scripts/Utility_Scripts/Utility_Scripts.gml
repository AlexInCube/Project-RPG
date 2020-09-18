///@description CallUserEvent(eventNum, args)
///@param eventNumber
///@param args
// Assumes an object is calling implicitly, may prefer to add in an object argument for clarity
function CallUserEvent(argument0,argument1){
	var eventNum = argument0;
	var args = argument1;

	__eventArgs = args;
	event_user(eventNum);
	__eventArgs = 0; // Clear the argument variable after event call to ensure no unexpected issues
}