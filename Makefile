PID_FILE := .slidev.pid
PORT := 3030

.PHONY: all start stop restart status build clean dist-clean check security format

all: start

clean:
	rm -rf dist/
	rm -f .slidev.pid slidev.log
	rm -f test-*.png step-slide*-*.png step*-c*.png

dist-clean: clean
	rm -rf node_modules/
	rm -f package-lock.json

start:
	@if [ -f $(PID_FILE) ] && kill -0 $$(cat $(PID_FILE)) 2>/dev/null; then \
		echo "Slidev is already running (PID: $$(cat $(PID_FILE)))"; \
	else \
		echo "Starting Slidev presentation..."; \
		nohup npx slidev --port $(PORT) --open > slidev.log 2>&1 & echo $$! > $(PID_FILE); \
		sleep 2; \
		echo "Slidev started (PID: $$(cat $(PID_FILE))). Open at http://localhost:$(PORT)"; \
	fi

stop:
	@if [ -f $(PID_FILE) ]; then \
		PID=$$(cat $(PID_FILE)); \
		if kill -0 $$PID 2>/dev/null; then \
			echo "Stopping Slidev (PID: $$PID)..."; \
			kill $$PID 2>/dev/null || true; \
		fi; \
		rm -f $(PID_FILE); \
	fi; \
	pkill -f "slidev" 2>/dev/null || true; \
	echo "Slidev presentation stopped."

restart: stop start

status:
	@if [ -f $(PID_FILE) ] && kill -0 $$(cat $(PID_FILE)) 2>/dev/null; then \
		echo "Slidev is RUNNING (PID: $$(cat $(PID_FILE)))"; \
	else \
		echo "Slidev is STOPPED"; \
	fi

build:
	npm run build

check:
	@echo "Running lint/type checks..."
	@npm run lint 2>/dev/null || echo "No lint script defined; skipping"

security:
	@echo "Running security audit..."
	@npm audit --audit-level=moderate

format:
	@echo "Formatting code..."
	@npx prettier --write . 2>/dev/null || echo "Prettier not installed; skipping"
