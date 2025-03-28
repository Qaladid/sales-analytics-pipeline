import dlt
from dlt.sources.sql_database import sql_database
from dlt.sources.credentials import ConnectionStringCredentials


def load_select_tables_from_database():
    """Loads selected tables from SQL Server to Snowflake (Full Load)."""

    # Create a pipeline
    pipeline = dlt.pipeline(
        pipeline_name="sql_server_to_snowflake",
        destination="snowflake",
        dataset_name="staging"
    )

    # Explicitly set credentials from secrets.toml
    credentials = ConnectionStringCredentials(
        "mssql+pyodbc://<username>:<password>@<server>/<database>?driver=ODBC+Driver+17+for+SQL+Server"
    )

    # Select specific tables to ingest
    source = sql_database(credentials).with_resources(
        "ProductReview"
    )


    # Run the pipeline with full load (replace all data)
    info = pipeline.run(source, write_disposition="replace")
    print(info)
    

if __name__ == "__main__":
    load_select_tables_from_database()