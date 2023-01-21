class BaseImporter
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    CSV.foreach(file_path, quote_char: '"') { |row| import(row) }
  end

  private

  attr_reader :file_path

  def import(row)
    row_with_headers = self.class::HEADERS.zip(row).to_h

    return if self.class::MODEL.find_by(
      self.class::COL_IDENTIFIER => row_with_headers[self.class::ROW_IDENTIFIER]
    )

    self.class::MODEL.create(row_with_headers)
  end
end
