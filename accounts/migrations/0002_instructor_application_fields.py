from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='instructor_portfolio_url',
            field=models.URLField(blank=True, help_text='GitHub, personal site, or portfolio link'),
        ),
        migrations.AddField(
            model_name='user',
            name='instructor_teaching_url',
            field=models.URLField(blank=True, help_text="Udemy, YouTube, or other platform where you've taught before (optional)"),
        ),
        migrations.AddField(
            model_name='user',
            name='instructor_credentials_url',
            field=models.URLField(blank=True, help_text='Link to your resume, CV, or certificate (Google Drive, Dropbox, LinkedIn, etc.)'),
        ),
    ]