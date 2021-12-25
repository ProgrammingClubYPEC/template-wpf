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
using template_wpf.db;
using template_wpf.pages;

namespace template_wpf
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Page _currentPage;
        public Page CurrentPage
        {
            get { return _currentPage; }
            set
            {
                if (_currentPage == value)
                    return;

                _currentPage = value;
                OnPropertyChanged("CurrentPage");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private List<string> userRoleNameList;

        public MainWindow(login _login)
        {
            InitializeComponent();
            DataContext = Instance.GetContext().user.Where(p => p.login == _login.login1).FirstOrDefault();
            userRoleNameList = Instance.GetContext().user_role.Select(p => p.name).ToList();

            logoUser.Source = pictureLogo(((user)DataContext).user_role);
            CurrentPage = page((user)DataContext);
            PageFrame.Content = CurrentPage;
        }

        private ImageSource pictureLogo(user_role role)
        {
            return new BitmapImage(new Uri(System.IO.Path.GetFullPath($"../../Resources/pic/{role.name}.png")));
        }

        private Page page(user _user)
        {
            user_role role = _user.user_role;
            if (role.name.Equals(userRoleNameList.ElementAt(0)))
                return new ModeratorPage(_user, this);
            else // user
                return new UserPage(_user, this);
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            Owner.Show();
            (Owner as signin).clearFieldBox();
        }

        private void WindowClose(object sender, RoutedEventArgs e)
        {
            Close();
        }

    }
}
