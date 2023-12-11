1. UI = UI = F(state)  
2. Jenis state dalam flutter yaitu Ephemeral State tidak sering di gunakan pada widget yang lain atau tidak ada ketergantungan terhadap widget yang lain, misalnya PageView, BottomNavigationBar, dan Switc Button, pada state ini tidak perlu state management yang kompleks, hanya membutuhkan StatefulWidget, jadi saat pakai setSet misalnya dipakai pada StatelessWidget tidak dapat digunakan, kalau ingin mengubah keadaan pada aplikasi menggunakan setSatet pada StateFulWidget.
3. AppSatate (global State) dapat di gunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget. 
4. Pendekatan State Management terdapat 3 bagian yaitu
a. setState : Lebih cocok penggunaan nya pada Ephemeral state
b. Provider : 
c. BloC : mengubah masukan dari penggunaan nantinya akan UI nya di reload setiap widget nya