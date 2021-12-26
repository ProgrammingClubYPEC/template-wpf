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

namespace template_wpf.widgets
{
    /// <summary>
    /// Логика взаимодействия для AddNewUserWidget.xaml
    /// </summary>
    public partial class AddNewUserWidget : Page
    {
        Window parentWindow;
        public AddNewUserWidget(Window parent)
        {
            InitializeComponent();
            parentWindow = parent;

            user _user = new user()
            {
                login1 = new login(),
                user_contact = new user_contact(),
                user_confidential_data = new user_confidential_data()
            };

            DataContext = _user;
            userRoleCB.ItemsSource = Instance.GetContext().user_role.ToList();
        }


        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            user newUser = (user)DataContext;
            newUser.login1.login1 = newUser.login;
            newUser.login1.user = newUser;
            newUser.user_role = userRoleCB.SelectedItem as user_role;
            newUser.code_role = newUser.user_role.code_role;
            newUser.user_role.user.Add(newUser);

            newUser.user_contact.user = newUser;
            newUser.user_confidential_data.user = newUser;

            Instance.GetContext().login.Add(newUser.login1);
            Instance.GetContext().user_contact.Add(newUser.user_contact);
            Instance.GetContext().user_confidential_data.Add(newUser.user_confidential_data);
            Instance.GetContext().user.Add(newUser);
            Instance.GetContext().SaveChanges();
            if (Instance.GetContext().user.Where(p => p.login == newUser.login).FirstOrDefault() != null)
            {
                MessageBox.Show("Пользователь успешно добавлен", "Добавление пользователя", MessageBoxButton.OK, MessageBoxImage.Information);
                parentWindow.Close();
            }
            else
                MessageBox.Show("Пользователя не удалось добавить", "Добавление пользователя", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
