using System.Collections.Generic;
using Caliburn.Micro;
using events4me.Assets;
using events4me.data.Models;
using events4me.Helpers;
using RestSharp;
using System.Threading;
using System.Windows;
using System.Windows.Navigation;

namespace events4me.ViewModels
{
    public class HomeViewModel : ViewModelBase
    {
        readonly INavigationService _navigationService;

        readonly IEventAggregator _events;

        public HomeViewModel(INavigationService navigationService, IEventAggregator events)
        {
            _navigationService = navigationService;
            _events = events;
        }

        private IEnumerable<Event> events;
        public IEnumerable<Event> Events
        {
            get { return events; }
            set
            {
                events = value;
                NotifyOfPropertyChange(() => Events);
            }
        }

        private User currentUser;
        public User CurrentUser
        {
            get { return currentUser; }
            set
            {
                currentUser = value;
                NotifyOfPropertyChange(() => CurrentUser);
            }
        }

        private void LoadData()
        {
            var api = new Events4meApi(Helpers.Extensions.RetrieveToken());
            api.GetEvents(
                (response) =>
                {
                    if (response.ResponseStatus != ResponseStatus.Error)
                        Events = response.Data;
                });

            api.GetUser(
                (response) =>
                {
                    if (response.ResponseStatus != ResponseStatus.Error)
                        CurrentUser = response.Data;
                });
        }

        public void Logout()
        {
            AppSettings.StoreSetting(Resources.TokenParameter, string.Empty);
            _navigationService.UriFor<MainPageViewModel>().Navigate();

        }

        protected override void OnViewReady(object view)
        {
            base.OnViewReady(view);

            LoadDataDelayed();
        }

        public void LoadDataDelayed()
        {
            Thread t = new Thread(load => DelayedLoadData(1000));
            t.Start();
        }

        private void DelayedLoadData(int delay)
        {
            System.Threading.Thread.Sleep(delay);
            Deployment.Current.Dispatcher.BeginInvoke(() =>
            {
                LoadData();
            });
        }

        NavigatedEventHandler navigatedHandler;

        public void OpenDetails(Event currentEvent)
        {
            navigatedHandler += (s, e) =>
                {
                    _navigationService.Navigated -= navigatedHandler;
                    _events.Publish(currentEvent);
                };

            _navigationService.Navigated += navigatedHandler;
            _navigationService.UriFor<EventDetailsViewModel>()
                .Navigate();
        }
    }
}
