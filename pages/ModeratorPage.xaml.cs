using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using template_wpf.common;
using template_wpf.db;
using template_wpf.widgets;

namespace template_wpf.pages
{
    /// <summary>
    /// Логика взаимодействия для ModeratorPage.xaml
    /// </summary>
    public partial class ModeratorPage : Page
    {
        private Page _userCardCurrentWidget;
        public Page UserCardCurrentWidget
        {
            get { return _userCardCurrentWidget; }
            set
            {
                if (_userCardCurrentWidget == value)
                    return;

                _userCardCurrentWidget = value;
                OnPropertyChanged("CurrentPage");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        Window parentWindow;

        public ModeratorPage(user _user, Window parent)
        {
            InitializeComponent();
            DataContext = _user;
            parentWindow = parent;

            updateState();
            UserCardCurrentWidget = new UserCardWidget(this);
            UserCardFrame.Content = UserCardCurrentWidget;
        }
        
        public void updateState()
        {
            Instance.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            userTabel.ItemsSource = Instance.GetContext().user.Where(p => !p.login.Equals(((user)DataContext).login)).ToList();
        }

        private void AddUser_Click(object sender, RoutedEventArgs e)
        {
            CommonWindow window = new CommonWindow();
            AddNewUserWidget widget = new AddNewUserWidget(window);
            window.setPage(widget);
            window.ShowDialog();
            updateState();
        }

        private void userTabel_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (userTabel.SelectedItem == null)
                return;

            user employee = (user)userTabel.SelectedItem;
            if (employee == null)
                return;

            (UserCardCurrentWidget as UserCardWidget).setUser(employee);
        }
    }
}
