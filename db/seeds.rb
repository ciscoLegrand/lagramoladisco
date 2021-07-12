# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:'superadmin',last_name:'superadmin',email: 'creadix@creadix.es',password:'cisco005passFTP_',role:'superadmin')
User.create(name:'adrian',last_name:'',email: 'adrian@lagramoladisco.com',password:'adri004passGRAMOLA',role:'admin')

WebConfig.create(
  enterprise_name: 'La Gramola Discotecas Móviles', 
  url_web: 'www.lagramoladisco.com', 
  cif: '', 
  corporative_color: '', 
  global_email:'info@lagramoladisco.com', 
  contact_phone:'645223021',
  adress_line_one:'Rúa do Restollal, 37',
  adress_line_two:'',
  location: 'Santiago',
  postal_code:'15702',
  region:'A Coruña',
  country:'Spain', 
  url_facebook:'https://es-es.facebook.com/gramoladisco',
  url_instagram:'https://www.instagram.com/lagramoladisco/?hl=es',
  url_pinterest:'',url_twitter:'https://twitter.com/lagramoladisco?lang=es',
  url_bodas_net:'https://www.bodas.net/musica/la-gramola-discotecas-moviles--e15600',
  language:'ES', 
  meta_title:'La gramola disco',
  meta_description:'La gramola disco', 
  ftp_user:'', 
  ftp_password:'',
  secret_key_recaptcha:'',
  public_key_recaptcha:''
)