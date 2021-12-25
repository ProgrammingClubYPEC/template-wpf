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
using System.Windows.Shapes;
using template_wpf.db;

namespace template_wpf
{
    /// <summary>
    /// Логика взаимодействия для signin.xaml
    /// </summary>
    public partial class signin : Window
    {
        private login _login;

        public signin()
        {
            InitializeComponent();
            logo_app.Source = new BitmapImage(new Uri(System.IO.Path.GetFullPath("../../Resources/pic/network_pic.png")));
            _login = new login();
        }

        private void signButton_Click(object sender, RoutedEventArgs e)
        {
            if (!Instance.loginValidated(_login))
            {
                MessageBox.Show("Необходимо заполнить все поля!", "Ошибка ввода", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if ((from l in Instance.GetContext().login
                 where l.login1 == _login.login1 && l.password == _login.password
                 select l).ToList().Count() != 1)
            {
                MessageBox.Show("Не удалось авторизироваться!\nЛогин или пароль не корректны.", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            Hide();
            MainWindow window = new MainWindow(_login);
            window.Owner = this;
            window.Show();
        }

        public void clearFieldBox()
        {
            tbLogin.Text = string.Empty;
            tbPwd.Password = string.Empty;
            tbLogin_LostFocus(this, null);
            tbPwd_LostFocus(this, null);
        }

        private void tbLogin_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (_login != null)
                _login.login1 = tbLogin.Text;
        }

        private void tbPwd_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (_login != null)
                _login.password = tbPwd.Password;
        }

        private void tbPwd_GotFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(_login.password))
            {
                tbPwd.Password = string.Empty;
                tbPwd.Foreground = Brushes.Black;
            }
        }

        private void tbPwd_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(_login.password))
            {
                tbPwd.Password = $"password...";
                _login.password = string.Empty;
                tbPwd.Foreground = Brushes.Gray;
            }
        }

        private void tbLogin_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(_login.login1))
            {
                tbLogin.Text = $"login...";
                _login.login1 = string.Empty;
                tbLogin.Foreground = Brushes.Gray;
            }
        }

        private void tbLogin_GotFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(_login.login1))
            {
                tbLogin.Text = string.Empty;
                tbLogin.Foreground = Brushes.Black;
            }
        }

    }
}
