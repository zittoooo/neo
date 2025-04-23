run:
	cd python && uvicorn app:app --host 0.0.0.0 --port 3000 --reload &
	cd node && pm2 start app.js

stop:
	pm2 stop all
	pkill -f "uvicorn"

rerun: stop run