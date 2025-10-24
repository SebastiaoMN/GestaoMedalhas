import { Injectable, signal } from '@angular/core';
import Keycloak, { KeycloakConfig } from 'keycloak-js';

const keycloakConfig: KeycloakConfig = {
  url: 'http://localhost:8081',
  realm: 'gmweb',
  clientId: 'gmweb-spa'
};

@Injectable({ providedIn: 'root' })
export class AuthService {
  private keycloak = new Keycloak(keycloakConfig);
  private authenticated = signal(false);

  async init(): Promise<void> {
    const authenticated = await this.keycloak.init({ onLoad: 'check-sso', pkceMethod: 'S256' });
    this.authenticated.set(authenticated);
  }

  login(): void {
    this.keycloak.login();
  }

  logout(): void {
    this.keycloak.logout({ redirectUri: window.location.origin });
  }

  isAuthenticated(): boolean {
    return this.authenticated();
  }

  getToken(): Promise<string> {
    return this.keycloak.updateToken(30).then(() => this.keycloak.token ?? '');
  }
}
