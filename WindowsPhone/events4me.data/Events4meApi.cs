using System;
using System.Collections.Generic;
using events4me.data.Models;
using RestSharp;

namespace events4me.Helpers
{
    public class Events4meApi
    {
        const string BaseUrl = "http://events4me.in";

        readonly string _authToken;

        public Events4meApi(string authToken)
        {
            _authToken = authToken;
        }

        public RestRequestAsyncHandle ExecuteAsync<T>(RestRequest request, Action<IRestResponse<T>> callback) where T : new()
        {
            var client = new RestClient();
            client.BaseUrl = BaseUrl;
            request.AddParameter("auth_token", _authToken);
            return client.ExecuteAsync<T>(request,
                                   (response) =>
                                   {
                                       if (callback != null)
                                           callback(response);
                                   });
        }

        public RestRequestAsyncHandle GetEvents(Action<IRestResponse<List<Event>>> callback)
        {
            var request = new RestRequest("events.json", Method.GET);

            return ExecuteAsync<List<Event>>(request,
                                          (response) =>
                                          {
                                              if (callback != null)
                                                  callback(response);
                                          });
        }

        public RestRequestAsyncHandle GetEvent(int id, Action<IRestResponse<Event>> callback)
        {
            var request = new RestRequest("events/{id}.json", Method.GET);
            request.AddParameter("id", id);

            return ExecuteAsync<Event>(request,
                                          (response) =>
                                          {
                                              if (callback != null)
                                                  callback(response);
                                          });
        }

        public RestRequestAsyncHandle GetUser(Action<IRestResponse<User>> callback)
        {
            var request = new RestRequest("me.json", Method.GET);

            return ExecuteAsync<User>(request,
                                          (response) =>
                                          {
                                              if (callback != null)
                                                  callback(response);
                                          });
        }
    }
}
