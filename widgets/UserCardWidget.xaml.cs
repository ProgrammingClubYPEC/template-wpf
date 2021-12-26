using System;
using System.Collections.Generic;
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

namespace template_wpf.widgets
{
    /// <summary>
    /// Логика взаимодействия для UserCardWidget.xaml
    /// </summary>
    public partial class UserCardWidget : Page
    {
        Page parentPage;
        List<user_role> roles;
        public UserCardWidget(Page _parentPage)
        {
            InitializeComponent();
            parentPage = _parentPage;
            roles = Instance.GetContext().user_role.ToList();

            updateState();
        }

        public void setUser(user _user)
        {
            DataContext = _user;
            updateState();
        }

        private void DownBtn_Click(object sender, RoutedEventArgs e)
        {
            changeRole(1);
        }

        private void UpBtn_Click(object sender, RoutedEventArgs e)
        {
            changeRole(-1);
        }

        private void changeRole(int isUp)
        {
            user employee = (user)DataContext;
            if (employee != null)
            {
                int index = roles.IndexOf(employee.user_role);
                if (index + isUp < 0 || index + isUp >= roles.Count)
                    return;

                user_role upRole = roles.ElementAt(index + isUp);
                employee.code_role = upRole.code_role;
                employee.user_role = upRole;
                Instance.GetContext().SaveChanges();
                updateState();
                (parentPage as ModeratorPage).updateState();
            }
        }

        private void updateState()
        {
            user employee = (user)DataContext;
            pictureUser.Visibility = employee != null ? Visibility.Visible : Visibility.Hidden;
            UpBtn.Visibility = employee != null ? Visibility.Visible : Visibility.Hidden;
            DownBtn.Visibility = employee != null ? Visibility.Visible: Visibility.Hidden;
            RemoveBtn.Visibility = employee != null ? Visibility.Visible : Visibility.Hidden;
            if (employee != null && employee.user_role != null)
            {
                UpBtn.IsEnabled = employee.user_role != roles.FirstOrDefault();
                DownBtn.IsEnabled = employee.user_role != roles.Last();
                pictureUser.Source = new BitmapImage(new Uri(System.IO.Path.GetFullPath($"../../Resources/pic/{employee.user_role.name}.png")));
            }
        }

        private void RemoveBtn_Click(object sender, RoutedEventArgs e)
        {
            user removeUser = (user)DataContext;
            login removeLogin = removeUser.login1;
            if (removeUser.user_contact != null)
                Instance.GetContext().user_contact.Remove(removeUser.user_contact);
            if (removeUser.user_confidential_data != null)
                Instance.GetContext().user_confidential_data.Remove(removeUser.user_confidential_data);
            Instance.GetContext().user.Remove(removeUser);
            if (removeLogin != null)
                Instance.GetContext().login.Remove(removeLogin);
            Instance.GetContext().SaveChanges();
            
            updateState();
            (parentPage as ModeratorPage).updateState();
        }
    }
}
