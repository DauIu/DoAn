from django.apps import AppConfig


class HomeConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'Home'

    def ready(self):
        from django.contrib.auth import get_user_model
        from .models import ThanhPho, Quan, Phuong
        CustomUser = get_user_model()

        # Check and create default admin user
        email = 'dauiu001@gmail.com'
        if not CustomUser.objects.filter(email=email).exists():
            city = ThanhPho.objects.get(MaTP=2)  # TP.HCM
            district = Quan.objects.get(MaQuan=18)  # Tân phú
            ward = Phuong.objects.get(MaPhuong=78) #tây thạnh

            CustomUser.objects.create_superuser(
                email=email,
                full_name='Fresh Fruit',
                street='140 Lê Trọng Tấn',
                ward=ward,
                district=district,
                city=city,
                username='admin',
                phone='02862706275',
                password='ad123'
            )
