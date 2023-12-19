echo 'module/gen klasörüne geçiş yapılıyor'
cd module && cd gen
echo 'dosyalar generate ediliyor'
dart run build_runner build
