SELECT NumEmploye, Nom, Prenom, NumSuperieur
FROM Employe;

SELECT *
FROM depot;

SELECT NumEmploye, Nom, Prenom, Fonction
FROM Employe
WHERE lower(Fonction) = 'ingenieur';

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Salaire>25000;

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE NOT (Salaire<50000);

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Salaire BETWEEN 15000 AND 25000;

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Salaire NOT BETWEEN 15000 AND 25000;

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Salaire > 15000 AND Salaire<25000;

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Salaire = 15000 OR Salaire=25000;

--10
SELECT NumEmploye, Nom, Prenom, Numdept
FROM Employe
WHERE Numdept IN(10,30,50);

--11
SELECT NumEmploye, Nom, Prenom, Numdept
FROM Employe
WHERE Numdept NOT IN(10,30,50);
--12
--Avec opérateur Like
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Prenom LIKE 'Mo%';

--Avec Fonction REGEXP_LIKE et Expression régulière
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  '^Mo');

--13
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Prenom LIKE '%id';

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  'id$');

--14
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Prenom LIKE '%ou%';

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  'ou');

--15
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Prenom LIKE '_atine';

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  '^.{1}atine');

--16
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  '^[FT].*[dk]$');

--17
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  '^[R-T]');

--18
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  '^[^R-T]');

--19
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE Prenom LIKE '%\_%' ESCAPE '\';

SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE REGEXP_LIKE(Prenom,  '_');

--20
SELECT NumEmploye, Nom, Prenom, Salaire, ComplementSalaire
FROM Employe
WHERE ComplementSalaire is  NOT NULL;

--21
SELECT NumEmploye, Nom, Prenom, Salaire
FROM Employe
WHERE NumDept = 20 and salaire>15000;

--22
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept, Fonction
FROM Employe
WHERE NumDept = 20 OR UPPER(fonction) = 'INGENIEUR';

--23
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept, Fonction
FROM Employe
WHERE NumDept = 20 AND Salaire > 15000 OR UPPER(fonction) = 'INGENIEUR';

--24
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept, Fonction
FROM Employe
WHERE Salaire > 15000 AND (NumDept = 20  OR UPPER(fonction) = 'INGENIEUR');

--25
SELECT Fonction
FROM Employe;

--26
SELECT DISTINCT Fonction
FROM Employe;

SELECT UNIQUE Fonction
FROM Employe;

--27
SELECT NumDept, Fonction, NumEmploye, Nom, Prenom, Salaire 
FROM Employe;

--28-
SELECT NumDept, Fonction, NumEmploye, Nom, Prenom, Salaire 
FROM Employe
ORDER BY NumDept ASC;

--29
SELECT NumDept, Fonction, NumEmploye, Nom, Prenom, Salaire 
FROM Employe
ORDER BY  NumDept, Fonction DESC;

--30
SELECT NumDept, Fonction, NumEmploye, Nom, Prenom, Salaire 
FROM Employe
ORDER BY  NumDept, Fonction DESC, Nom;



--31
SELECT NumEmploye AS "Numero de l'Employe", Nom AS "Nom de l'Employe"
FROM Employe;

--32
SELECT NumEmploye, Salaire, ComplementSalaire, (Salaire + NVL(ComplementSalaire, 0)) AS SG
FROM Employe;

--33
SELECT NumEmploye, EXTRACT(YEAR FROM DateEmbauche) AS AnneeEmbauche
FROM Employe;

--34
SELECT NumEmploye, NOM || ' ' ||Prenom AS Identite
FROM Employe;

--35
SELECT NumEmploye, SUBSTR(Prenom, 0, 1) ||'.' || Nom As Identite
FROM Employe;

--36
SELECT Reference, PrixVente * (1-TauxRemise)*QteCommandee AS Montant
FROM detailcommande
ORDER BY Reference;

--37
SELECT NumEmploye, Nom, Prenom, ROUND((SYSDATE-DateEmbauche)/365,2) Anciennete
FROM Employe;

--38
SELECT NumEmploye, Nom, Prenom, ROUND((DateEmbauche-datenaissance)/365,0) AgeEmbauche
FROM Employe;

--39
SELECT Employe.*, Departement.*
FROM Employe INNER JOIN Departement ON Employe.NumDept = Departement.NumDept;

SELECT E.*, D.*
FROM Employe E INNER JOIN Departement D ON E.NumDept = D.NumDept;

--40
SELECT E.NumEmploye, E.Nom, E.Prenom, E.NumDept , D.Nom NomDept
FROM Employe E INNER JOIN Departement D ON E.NumDept = D.NumDept;

--41 
SELECT CodeClient, Nom, C.Ville
FROM Client C INNER JOIN Fournisseur F ON C.Ville > F.Ville
WHERE UPPER(RaisonSociale) = 'SOS INFO';

--42
SELECT P.Reference, Designation, PrixAchat, PrixVente
FROM Produit P LEFT JOIN DetailCommande DC ON P.Reference = DC.Reference
ORDER BY Reference;

--43
SELECT Clt.CodeClient, Nom, numcommande, DateCommande
FROM Commande cmd RIGHT JOIN Client clt ON cmd.CodeClient = clt.CodeClient
ORDER BY 1;

--44
SELECT E1.NumEmploye, E1.Nom NomEmploye, E1.Prenom PrenomEmploye, E1.NumSuperieur, E2.Nom NomSuperieur, E2.Prenom PrenomSuperieur
FROM Employe E1 INNER JOIN EMPLOYE E2 ON E1.NumSuperieur = E2.NumEmploye;

--45
SELECT D.CodeDepot, D.AdresseDepot, P.reference, P.Designation, S.QteEnStock
FROM (Depot D INNER JOIN Stock S ON D.CodeDepot = S.CodeDepot) INNER JOIN Produit P ON S.Reference = P.Reference;

--46
SELECT E.NumEmploye, E.Nom, Prenom, Clt.CodeClient, Clt.Nom
FROM Employe E INNER JOIN Commande Cmd ON E.NumEmploye = Cmd.NumEmploye INNER JOIN Client Clt ON Cmd.CodeClient = Clt.CodeClient;

--47
SELECT Clt.CodeClient, Nom, P.Reference, Designation, QteCommandee, PrixVente
FROM Client Clt INNER JOIN Commande Cmd ON Clt.CodeClient = Cmd.CodeClient 
INNER JOIN DetailCommande DC ON Cmd.NumCommande = DC.NumCommande 
INNER JOIN Produit P ON P.Reference = DC.Reference; 

--49
SELECT SUM(Salaire) TotalSalaire
FROM Employe;

--50
SELECT AVG(Salaire) SalaireMoyen
FROM Employe;

--51
SELECT AVG(Salaire) SalaireMoyen, SUM(Salaire) TotalSalaire
FROM Employe;

--52
SELECT SUM(ComplementSalaire) As CSalaireGlobal
FROM Employe
WHERE UPPER(Fonction) = 'COMMERCIAL';

--53
SELECT COUNT(*)AS NbEmploye
FROM Employe;

--54
SELECT COUNT(*) AS NbEmploye, AVG(Salaire) AS SalaireMoyen
FROM Employe
WHERE Salaire >20000;

--55
SELECT NumDept, COUNT(NumEmploye) AS NbEmploye, 
        ROUND(AVG(Salaire),2) AS SalaireMoyen
FROM Employe
GROUP BY NumDept
ORDER BY NumDept;

--56
SELECT EXTRACT(YEAR FROM DateEmbauche)AnneeEmbauche,
       AVG(Salaire) AS SalaireMoyen
FROM Employe
GROUP BY EXTRACT(YEAR FROM DateEmbauche)
ORDER BY 1;

--57
SELECT NumDept, Fonction, SUM(Salaire) AS SalaireGlobal, 
    ROUND(AVG(Salaire), 2) AS SalaireMoyen
FROM Employe
GROUP BY NumDept, Fonction;

--58
SELECT Fonction, ROUND(AVG(Salaire), 2) AS SalaireMoyen
FROM Employe
WHERE NumDept <> 30
GROUP BY Fonction
ORDER BY Fonction;

--59
SELECT Fonction, ROUND(AVG(Salaire),2) AS SalaireMoyen
FROM Employe
WHERE NumDept <>30
GROUP BY Fonction
HAVING AVG(Salaire)>20000;

--60
SELECT NumDept, ROUND(AVG(Salaire), 2) AS SalaireMoyen
FROM Employe
GROUP BY NumDept
HAVING COUNT(*)>5
ORDER BY NumDept;

--61
SELECT Ville
FROM Client
UNION
SELECT Ville
FROM Fournisseur;

SELECT Ville, 'Client' AS Origine
FROM Client
UNION
SELECT Ville, 'Fournisseur'
FROM Fournisseur;

--62
SELECT Nom, 'Employe' AS Origine
FROM Employe
UNION
SELECT Nom , 'Client'
FROM Client
UNION
SELECT RaisonSociale, 'Fournisseur'
FROM Fournisseur;

--63
La requête ci-dessous ne s'exécute car les champs numEmploye
et CodeFornisseur ne sont pas de ^type compatible

SELECT NumEmploye AS Numero, Nom
FROM Employe
UNION
SELECT CodeFournisseur, RaisonSociale
FROM Fournisseur;


--64
SELECT Ville
FROM Client
INTERSECT
SELECT Ville
FROM Fournisseur;

--65
SELECT Ville
FROM Client

MINUS

SELECT Ville
FROM Fournisseur;

--66
--Avec Sous-Requête
SELECT NumCommande, DateCommande, 
(SELECT Max(PrixVente)FROM DetailCommande DC 
  WHERE Cmd.NumCommande = DC.NumCommande) AS PrixVenteMax
FROM Commande Cmd;

--Avec Jointure
SELECT Cmd.NumCommande, DateCommande, Max(PrixVente) AS PrixVenteMax
FROM Commande Cmd INNER JOIN DetailCommande DC 
    ON Cmd.NumCommande = DC.NumCommande
GROUP BY Cmd.NumCommande, DateCommande
ORDER BY Cmd.NumCommande;

--67
SELECT Designation, PrixAchat
FROM Produit
WHERE PrixAchat = 
    (SELECT PrixAchat FROM Produit
    WHERE UPPER(Designation) = 'IMPRIMANTE LEXMARK 500');

--68
SELECT NumEmploye, Nom, EXTRACT (YEAR FROM DateEmbauche) AS AnneeEmbauche
FROM Employe
WHERE EXTRACT (YEAR FROM DateEmbauche) = 
(SELECT EXTRACT (YEAR FROM DateEmbauche)
 FROM Employe
 WHERE NumEmploye = 16712);
 
 --69
 SELECT Designation
 FROM Produit
 WHERE Reference IN 
    (SELECT Reference
     FROM Stock
     WHERE CodeDepot = 'DEP001');
     
--70
SELECT Designation
 FROM Produit
 WHERE Reference NOT IN 
    (SELECT Reference
     FROM Stock
     WHERE CodeDepot = 'DEP001');
--71
SELECT NumEmploye, Nom, Salaire, 
  (SELECT AVG(Salaire)
   FROM Employe) AS SalaireMoyen
FROM Employe;

--72
SELECT NumEmploye, Nom, Salaire,NumDept,
    ROUND((SELECT AVG(Salaire)
    FROM Employe E2
    WHERE E1.NumDept = E2.NumDept),2) AS SalaireMoyenDept
FROM Employe E1
ORDER BY NumDept;

--73- Modifier les prix d’achat des produits fournis par des fournisseur Marocain en les réduisant de 20%. 
UPDATE Produit
SET PrixAchat = PrixAchat -PrixAchat*20/100
WHERE Reference IN (SELECT Reference
                    FROM Fournisseur
                    WHERE UPPER(Pays) = 'MAROC');
                    
--Annuler les modifications
ROLLBACK;

--74- Supprimer les produits fournis par les fournisseurs Libyens. 
DELETE FROM Produit
WHERE Reference IN (SELECT Reference
                FROM Fournisseur
                WHERE UPPER(Pays) = 'LYBIE');
                
--Annuler les modifications
--Remarque : Il faut faire une suppression en cascade car un produit est référencé à parti de la table stock
-- et peut l'être également à partir de la table DetailCommande
ROLLBACK;

--75- Afficher les informations CodeClient, Nom et ville des clients qui se trouvent dans la même ville que le fournisseur ‘SOS INFO’. 
SELECT CodeClient, Nom, Ville
FROM Client
WHERE Ville = (SELECT Ville
               FROM Fournisseur
               WHERE UPPER(RaisonSociale) = 'SOS INFO');

--76- Afficher les informations NumEmploye, Nom, Prenom, Salaire, et NumDept des employés dont le salaire est inférieur au salaire de tous les employés du département N°20.
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept
FROM Employe
WHERE Salaire < (SELECT Min(Salaire)
                 FROM Employe
                 WHERE NumDept = 20);
                 
ou
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept
FROM Employe
WHERE Salaire < ALL(SELECT Salaire
                 FROM Employe
                 WHERE NumDept = 20);
                 
--77- Afficher les informations NumEmploye, Nom, Prenom, Salaire, et NumDept des employés dont le salaire est supérieur au salaire d’au moins un employé  du département N°20. 
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept
FROM Employe
WHERE Salaire > ANY (SELECT SALAIRE
                      FROM Employe
                      WHERE NumDept=20);
--Ou      
                      
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept
FROM Employe
WHERE Salaire > SOME (SELECT SALAIRE
                      FROM Employe
                      WHERE NumDept=20);
-Ou
                      
SELECT NumEmploye, Nom, Prenom, Salaire, NumDept
FROM Employe
WHERE Salaire >  (SELECT Min(SALAIRE)
                      FROM Employe
                      WHERE NumDept=20);
                      
--78- Afficher les informations CodeDepot et Ville des dépôts qui se trouvent dans une ville où il ya au moins un fournisseur.
SELECT CodeDepot, VilleDepot
FROM Depot
WHERE VilleDepot = ANY(SELECT VilleDepot
                   FROM Fournisseur);
                   
--79- Afficher les informations CodeDepot et Ville des dépôts qui se trouvent dans une ville où il n'y a aucun fournisseur. 
SELECT CodeDepot, VilleDepot
FROM Depot
WHERE VilleDepot <> ALL(SELECT Ville
                        FROM Fournisseur);
--Ou

SELECT CodeDepot, VilleDepot
FROM Depot
WHERE VilleDepot NOT IN (SELECT Ville
                        FROM Fournisseur);

--82- Afficher les noms des clients qui ont passé des commandes auprès de l’employé dont le numéro est 16034. 
SELECT Nom
FROM Client 
WHERE CodeClient IN(SELECT CodeClient
                    FROM Commande
                    WHERE NumEmploye = 16034);
--83- Refaire la question N°78 en utilisant l’opérateur EXISTS.
Afficher les informations CodeDepot et Ville des dépôts qui se trouvent dans une ville où il ya au moins  un fournisseur. 
SELECT CodeDepot, VilleDepot
FROM Depot D
WHERE EXISTS(SELECT Ville
            FROM Fournisseur F
            WHERE F.Ville = D.VilleDepot);
            
--85- Afficher les RaisonSociale des fournisseurs qui n’ont fourni aucun produit de la catégorie N°5. 
SELECT RaisonSociale
FROM Fournisseur F
WHERE NOT EXISTS(SELECT Reference
                  FROM Produit P
                  WHERE F.CodeFournisseur = P.CodeFournisseur AND P.CodeCategorie='ORD001');
                  


--87
SELECT DISTINCT Salaire
FROM (SELECT Salaire FROM EMPLOYE ORDER BY Salaire DESC)
WHERE ROWNUM <=5;

--88
SELECT DISTINCT Salaire
FROM (SELECT Salaire FROM EMPLOYE ORDER BY Salaire DESC)
WHERE ROWNUM <= 5/100*(SELECT COUNT(*) FROM Employe);


--93- Extraire les informations NumEmploye, nom, prénom, salaire et fonction des employés dont on saisit la fonction au clavier. 
--Variable de substitution (&fonction)
SELECT NumEmploye, Nom, Prenom, Fonction
FROM Employe
WHERE Fonction = '&fonction';

--94-Extraire les informations NumEmploye, nom, prénom, salaire et DateEmbauche embauchés entre une date de début et date de fin.
SELECT NumEmploye, Nom, Prenom, Salaire, DateEmbauche
FROM Employe
WHERE DateEmbauche BETWEEN TO_DATE('&DateDebut') AND TO_DATE('&DateFin');
