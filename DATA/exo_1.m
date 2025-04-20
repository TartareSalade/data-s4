% Étape 1: Charger les matrices
load Ex1.mat;

% Étape 2: Définir le vecteur u(t) = (cos(t), sin(t)) et calculer les formes bilinéaires
n = 100;
t = linspace(0, 2*pi, n);

% Initialiser les vecteurs pour stocker les résultats
phi_a = zeros(1, n);
phi_b = zeros(1, n);
phi_c = zeros(1, n);

% Calculer les valeurs des formes bilinéaires pour chaque t
for i = 1:n
    X = [cos(t(i)); sin(t(i))];
    phi_a(i) = X' * A * X;
    phi_b(i) = X' * B * X;
    phi_c(i) = X' * C * X;
end

% Afficher les matrices
disp('Matrice A:');
disp(A);
disp('Matrice B:');
disp(B);
disp('Matrice C:');
disp(C);

% Tracer les trois graphes séparément
figure(1);
plot(t, phi_a, 'b-', 'LineWidth', 2);
title('Graphe de \phi_A(u(t),u(t))');
xlabel('t');
ylabel('\phi_A');
grid on;

figure(2);
plot(t, phi_b, 'r-', 'LineWidth', 2);
title('Graphe de \phi_B(u(t),u(t))');
xlabel('t');
ylabel('\phi_B');
grid on;

figure(3);
plot(t, phi_c, 'g-', 'LineWidth', 2);
title('Graphe de \phi_C(u(t),u(t))');
xlabel('t');
ylabel('\phi_C');
grid on;

% Tracer les trois graphes sur une même figure pour comparaison
figure(4);
plot(t, phi_a, 'b-', t, phi_b, 'r-', t, phi_c, 'g-', 'LineWidth', 2);
title('Comparaison des trois formes bilinéaires');
xlabel('t');
ylabel('Valeurs des formes');
legend('\phi_A', '\phi_B', '\phi_C');
grid on;

% Étape 3: Diagonalisation des matrices
[PA, DA] = eig(A);
[PB, DB] = eig(B);
[PC, DC] = eig(C);

% Afficher les valeurs propres
disp('Valeurs propres de A:');
disp(diag(DA)');
disp('Vecteurs propres de A:');
disp(PA);

disp('Valeurs propres de B:');
disp(diag(DB)');
disp('Vecteurs propres de B:');
disp(PB);

disp('Valeurs propres de C:');
disp(diag(DC)');
disp('Vecteurs propres de C:');
disp(PC);

% Déterminer si les formes sont des produits scalaires
produit_scalaire_A = all(diag(DA) > 0);
produit_scalaire_B = all(diag(DB) > 0);
produit_scalaire_C = all(diag(DC) > 0);

% Afficher les résultats
disp('Forme bilinéaire φA est un produit scalaire:');
disp(produit_scalaire_A);

disp('Forme bilinéaire φB est un produit scalaire:');
disp(produit_scalaire_B);

disp('Forme bilinéaire φC est un produit scalaire:');
disp(produit_scalaire_C);

% Afficher les minimum et maximum pour chaque forme bilinéaire
disp('Valeur minimale de φA(u(t),u(t)):');
disp(min(phi_a));
disp('Valeur maximale de φA(u(t),u(t)):');
disp(max(phi_a));

disp('Valeur minimale de φB(u(t),u(t)):');
disp(min(phi_b));
disp('Valeur maximale de φB(u(t),u(t)):');
disp(max(phi_b));

disp('Valeur minimale de φC(u(t),u(t)):');
disp(min(phi_c));
disp('Valeur maximale de φC(u(t),u(t)):');
disp(max(phi_c));