import ballerina/ai;
import ballerina/http;

listener ai:Listener jokeAgentListener = new (listenOn = check http:getDefaultListener());

service /joke\-agent on jokeAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        string stringResult = check jokeAgent.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
