# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Admin(models.Model):
    admin_rut = models.CharField(db_column='ADMIN_RUT', primary_key=True, max_length=13)  # Field name made lowercase.
    admin_mombre = models.CharField(db_column='ADMIN_MOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.
    admin_pass = models.CharField(db_column='ADMIN_PASS', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'admin'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Banco(models.Model):
    banco_id = models.IntegerField(db_column='BANCO_ID', primary_key=True)  # Field name made lowercase.
    banco_nombre = models.CharField(db_column='BANCO_NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'banco'


class Cliente(models.Model):
    cli_rut = models.CharField(db_column='CLI_RUT', primary_key=True, max_length=13)  # Field name made lowercase.
    cli_nombre = models.CharField(db_column='CLI_NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cliente'

class ComOf(models.Model):
    com = models.OneToOneField('Comanda', models.DO_NOTHING, db_column='COM_ID', primary_key=True)  # Field name made lowercase.
    of = models.ForeignKey('Oferta', models.DO_NOTHING, db_column='OF_ID')  # Field name made lowercase.
    com_of_cantidad = models.IntegerField(db_column='COM_OF_CANTIDAD', blank=True, null=True)  # Field name made lowercase.
    com_of_precio = models.IntegerField(db_column='COM_OF_PRECIO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'com_of'
        unique_together = (('com', 'of'),)



class ComProd(models.Model):
    com = models.OneToOneField('Comanda', models.DO_NOTHING, db_column='COM_ID', primary_key=True)  # Field name made lowercase.
    prod = models.ForeignKey('Producto', models.DO_NOTHING, db_column='PROD_ID')  # Field name made lowercase.
    cp_cantidad = models.IntegerField(db_column='CP_CANTIDAD', blank=True, null=True)  # Field name made lowercase.
    cp_precio = models.IntegerField(db_column='CP_PRECIO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'com_prod'
        unique_together = (('com', 'prod'),)


class Comanda(models.Model):
    com_id = models.IntegerField(db_column='COM_ID', primary_key=True)  # Field name made lowercase.
    gar_rut = models.ForeignKey('Garzon', models.DO_NOTHING, db_column='GAR_RUT')  # Field name made lowercase.
    ven = models.ForeignKey('Venta', models.DO_NOTHING, db_column='VEN_ID', blank=True, null=True)  # Field name made lowercase.
    cli_rut = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='CLI_RUT', blank=True, null=True)  # Field name made lowercase.
    mesa = models.ForeignKey('Mesa', models.DO_NOTHING, db_column='MESA_ID')  # Field name made lowercase.
    com_fecha_hora = models.DateTimeField(db_column='COM_FECHA_HORA', blank=True, null=True)  # Field name made lowercase.
    com_nro_personas = models.IntegerField(db_column='COM_NRO_PERSONAS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'comanda'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Garzon(models.Model):
    gar_rut = models.CharField(db_column='GAR_RUT', primary_key=True, max_length=13)  # Field name made lowercase.
    gar_nombre = models.CharField(db_column='GAR_NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'garzon'


class Mesa(models.Model):
    mesa_id = models.IntegerField(db_column='MESA_ID', primary_key=True)  # Field name made lowercase.
    mesa_nombre = models.CharField(db_column='MESA_NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'mesa'


class Oferta(models.Model):
    of_id = models.IntegerField(db_column='OF_ID', primary_key=True)  # Field name made lowercase.
    admin_rut = models.ForeignKey(Admin, models.DO_NOTHING, db_column='ADMIN_RUT')  # Field name made lowercase.
    of_finicio = models.DateField(db_column='OF_FINICIO', blank=True, null=True)  # Field name made lowercase.
    of_ffin = models.DateField(db_column='OF_FFIN', blank=True, null=True)  # Field name made lowercase.
    of_precio = models.IntegerField(db_column='OF_PRECIO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'oferta'


class Pago(models.Model):
    pago_id = models.IntegerField(db_column='PAGO_ID', primary_key=True)  # Field name made lowercase.
    banco = models.ForeignKey(Banco, models.DO_NOTHING, db_column='BANCO_ID')  # Field name made lowercase.
    ven = models.ForeignKey('Venta', models.DO_NOTHING, db_column='VEN_ID', blank=True, null=True)  # Field name made lowercase.
    tpag = models.ForeignKey('TipoPago', models.DO_NOTHING, db_column='TPAG_ID')  # Field name made lowercase.
    pago_fecha_hora = models.DateTimeField(db_column='PAGO_FECHA_HORA', blank=True, null=True)  # Field name made lowercase.
    pago_nro_boucher = models.CharField(db_column='PAGO_NRO_BOUCHER', max_length=100, blank=True, null=True)  # Field name made lowercase.
    pago_monto = models.IntegerField(db_column='PAGO_MONTO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pago'


class ProdOferta(models.Model):
    prod = models.OneToOneField('Producto', models.DO_NOTHING, db_column='PROD_ID', primary_key=True)  # Field name made lowercase.
    of = models.ForeignKey(Oferta, models.DO_NOTHING, db_column='OF_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'prod_oferta'
        unique_together = (('prod', 'of'),)


class Producto(models.Model):
    prod_id = models.IntegerField(db_column='PROD_ID', primary_key=True)  # Field name made lowercase.
    admin_rut = models.ForeignKey(Admin, models.DO_NOTHING, db_column='ADMIN_RUT')  # Field name made lowercase.
    tp = models.ForeignKey('TipoProd', models.DO_NOTHING, db_column='TP_ID')  # Field name made lowercase.
    prod_nombre = models.CharField(db_column='PROD_NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.
    prod_precio = models.IntegerField(db_column='PROD_PRECIO', blank=True, null=True)  # Field name made lowercase.
    prod_disponible = models.IntegerField(db_column='PROD_DISPONIBLE', blank=True, null=True)  # Field name made lowercase.
    prod_fecha_ingreso = models.DateField(db_column='PROD_FECHA_INGRESO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'producto'


class TipoPago(models.Model):
    tpag_id = models.IntegerField(db_column='TPAG_ID', primary_key=True)  # Field name made lowercase.
    tpag_nombre = models.CharField(db_column='TPAG_NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tipo_pago'


class TipoProd(models.Model):
    tp_id = models.IntegerField(db_column='TP_ID', primary_key=True)  # Field name made lowercase.
    tp_nombre = models.CharField(db_column='TP_NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tipo_prod'


class Venta(models.Model):
    ven_id = models.IntegerField(db_column='VEN_ID', primary_key=True)  # Field name made lowercase.
    ven_fecha = models.DateField(db_column='VEN_FECHA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'venta'
