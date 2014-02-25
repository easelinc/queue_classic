module QC
  module Setup
    Root = File.expand_path("../..", File.dirname(__FILE__))
    SqlFunctions = File.join(Root, "/sql/ddl.sql")
    CreateTable = File.join(Root, "/sql/create_table.sql")
    CreateJobCountIndex = File.join(Root, "/sql/create_job_count_index.sql")
    DropSqlFunctions = File.join(Root, "/sql/drop_ddl.sql")

    def self.create
      Conn.execute(File.read(CreateTable))
      Conn.execute(File.read(SqlFunctions))
      Conn.execute(File.read(CreateJobCountIndex))
    end

    def self.drop
      Conn.execute("DROP TABLE IF EXISTS queue_classic_jobs CASCADE")
      Conn.execute(File.read(DropSqlFunctions))
    end
  end
end
