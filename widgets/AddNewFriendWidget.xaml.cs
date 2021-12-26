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
    /// Логика взаимодействия для AddNewFriendWidget.xaml
    /// </summary>
    public partial class AddNewFriendWidget : Page
    {
        Window parentWindow;
        public AddNewFriendWidget(user sender, Window parent)
        {
            InitializeComponent();
            DataContext = sender;
            parentWindow = parent;
            UsersCB.ItemsSource = Instance.GetContext().friendship.Where(p => p.login_sender != sender.login).Select(p => p.user1).ToList();
        }

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            friendship ship = new friendship();
            ship.id = Instance.GetContext().friendship.Count() + 1;
            ship.login_sender = (DataContext as user).login;
            ship.user = (DataContext as user);
            user recirver = UsersCB.SelectedItem as user;
            if (recirver == null)
            {
                MessageBox.Show("Пользователь должен быть выбран", "Ошибка ввода", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            ship.login_recirver = recirver.login;
            ship.user1 = recirver;
            
            Instance.GetContext().friendship.Add(ship);
            Instance.GetContext().SaveChanges();
            Instance.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            if ((DataContext as user).friendship.Where(p => p.login_recirver == recirver.login).FirstOrDefault() != null)
            {
                MessageBox.Show("Пользователь успешно добавлен", "Добавление пользователя", MessageBoxButton.OK, MessageBoxImage.Information);
                parentWindow.Close();
            }
            else
                MessageBox.Show("Пользователя не удалось добавить", "Добавление пользователя", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
