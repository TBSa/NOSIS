namespace LineaSupermercado.DataAccess.Migrations
{
    using System;
    using System.Data.Entity.Migrations;

    public partial class InitiaMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Clients",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    Name = c.String(nullable: false, maxLength: 50),
                    ClientStatusId = c.Int(nullable: false),
                    SupermarketCheckoutId = c.Int(nullable: false),
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ClientStatus", t => t.ClientStatusId, cascadeDelete: true)
                .ForeignKey("dbo.SupermarketCheckouts", t => t.SupermarketCheckoutId, cascadeDelete: true)
                .Index(t => t.ClientStatusId)
                .Index(t => t.SupermarketCheckoutId);

            CreateTable(
                "dbo.ClientStatus",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    Description = c.String(nullable: false, maxLength: 50),
                })
                .PrimaryKey(t => t.Id);

            CreateTable(
                "dbo.SupermarketCheckouts",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    SupermarketCheckoutStatuId = c.Int(nullable: false),
                })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.SupermarketCheckoutStatus", t => t.SupermarketCheckoutStatuId, cascadeDelete: true)
                .Index(t => t.SupermarketCheckoutStatuId);

            CreateTable(
                "dbo.SupermarketCheckoutStatus",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    Description = c.String(nullable: false, maxLength: 50),
                })
                .PrimaryKey(t => t.Id);

            CreateStoredProcedure(
                "dbo.AddClient",
                p => new
                {
                },
                body:
                    @"DECLARE @Id AS INT;
	                    DECLARE @SupermarketCheckoutId AS INT;

	                    SET @Id = (SELECT IDENT_CURRENT('Clients') + 1);

	                    SET @SupermarketCheckoutId = (SELECT top 1
										                    s.Id
									                    FROM SupermarketCheckouts s
									                    WHERE s.SupermarketCheckoutStatuId = 1
									                    ORDER BY (select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 2) asc, 1 asc);


	                    INSERT INTO Clients
	                    VALUES(CONCAT('Cliente ', @Id),2,@SupermarketCheckoutId);"
            );

            CreateStoredProcedure(
                "dbo.CloseSupermarketCheckout",
                p => new
                {
                    Id = p.Int()
                },
                body:
                    @"DECLARE @SupermarketCheckoutId AS INT;

	                UPDATE SupermarketCheckouts
	                SET SupermarketCheckoutStatuId = 2
	                WHERE Id = @Id;

	                SET @SupermarketCheckoutId = (SELECT top 1
										                s.Id
									                FROM SupermarketCheckouts s
									                WHERE s.SupermarketCheckoutStatuId = 1
									                AND s.Id <> @Id
									                ORDER BY (select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 2) asc, 1 asc);

	                UPDATE Clients
	                SET SupermarketCheckoutId = @SupermarketCheckoutId
	                WHERE SupermarketCheckoutId = @Id AND ClientStatusId = 2;"
            );

            CreateStoredProcedure(
                "dbo.GetAllSupermarketCheckouts",
                p => new
                {
                },
                body:
                    @"SELECT 
		                s.Id AS 'Id',
		                CONCAT('Caja ', s.id) AS 'Description', 
		                (select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 1) AS 'ClientsServed', 
		                (select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 2) AS 'ClientsToAttend'
	                FROM SupermarketCheckouts s
	                WHERE s.SupermarketCheckoutStatuId = 1;"
            );

            CreateStoredProcedure(
                "dbo.ServeClient",
                p => new
                {
                    Id = p.Int()
                },
                body:
                    @"With c As
	                (
		                SELECT top 1 c.Id, c.ClientStatusId, c.SupermarketCheckoutId
		                FROM Clients c
		                WHERE c.ClientStatusId = 2 AND c.SupermarketCheckoutId = @Id
		                ORDER BY Id DESC
	                )

	                UPDATE c SET ClientStatusId = 1;"
            );

        }

        public override void Down()
        {
            DropForeignKey("dbo.Clients", "SupermarketCheckoutId", "dbo.SupermarketCheckouts");
            DropForeignKey("dbo.SupermarketCheckouts", "SupermarketCheckoutStatuId", "dbo.SupermarketCheckoutStatus");
            DropForeignKey("dbo.Clients", "ClientStatusId", "dbo.ClientStatus");
            DropIndex("dbo.SupermarketCheckouts", new[] { "SupermarketCheckoutStatuId" });
            DropIndex("dbo.Clients", new[] { "SupermarketCheckoutId" });
            DropIndex("dbo.Clients", new[] { "ClientStatusId" });
            DropTable("dbo.SupermarketCheckoutStatus");
            DropTable("dbo.SupermarketCheckouts");
            DropTable("dbo.ClientStatus");
            DropTable("dbo.Clients");
            DropStoredProcedure("AddClient");
            DropStoredProcedure("CloseSupermarketCheckout");
            DropStoredProcedure("GetAllSupermarketCheckouts");
            DropStoredProcedure("ServeClient");
        }
    }
}
