.PHONY: backend frontend docker-up docker-down k8s-apply k8s-delete lint

backend:
	cd backend && mvn spring-boot:run

frontend:
	cd frontend && npm start

docker-up:
	cd deployment/docker && docker compose up --build

docker-down:
	cd deployment/docker && docker compose down

k8s-apply:
	kubectl apply -f deployment/k8s/namespace.yaml
	kubectl apply -f deployment/k8s/backend-serviceaccount.yaml
	kubectl apply -f deployment/k8s/backend-secret.yaml
	kubectl apply -f deployment/k8s/backend-configmap.yaml
	kubectl apply -f deployment/k8s/oracle-statefulset.yaml
	kubectl apply -f deployment/k8s/keycloak-deployment.yaml
	kubectl apply -f deployment/k8s/backend-deployment.yaml
	kubectl apply -f deployment/k8s/frontend-deployment.yaml
	kubectl apply -f deployment/k8s/legacy-deployment.yaml
	kubectl apply -f deployment/k8s/ingress.yaml

k8s-delete:
	kubectl delete -f deployment/k8s/ingress.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/legacy-deployment.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/frontend-deployment.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/backend-deployment.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/keycloak-deployment.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/oracle-statefulset.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/backend-configmap.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/backend-secret.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/backend-serviceaccount.yaml --ignore-not-found
	kubectl delete -f deployment/k8s/namespace.yaml --ignore-not-found

lint:
	cd backend && mvn -q -DskipTests verify
	cd frontend && npm run lint
