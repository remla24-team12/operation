for i in {1..100}; do
  curl -o /dev/null -s -w "%{http_code}\n" http://192.168.56.10/app/
done
