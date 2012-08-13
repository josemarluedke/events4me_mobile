using events4me.data.Models;
using System.Threading;
using events4me.Helpers;
using System.Windows;
using RestSharp;
using Caliburn.Micro;

namespace events4me.ViewModels
{
    public class EventDetailsViewModel : ViewModelBase, IHandle<Event>
    {
        private Event currentEvent;
        public Event CurrentEvent
        {
            get { return currentEvent; }
            set
            {
                currentEvent = value;
                NotifyOfPropertyChange(() => CurrentEvent);
            }
        }

        readonly IEventAggregator events;

        public EventDetailsViewModel(IEventAggregator events)
        {
            this.events = events;
            events.Subscribe(this);
        }

        public void Handle(Event message)
        {
            CurrentEvent = message;
        }

        protected override void OnDeactivate(bool close)
        {
            events.Unsubscribe(this);
            base.OnDeactivate(close);
        }
    }
}
