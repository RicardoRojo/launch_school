class Complement
  VERSION = 3
  DNA_RNA_HASH = {'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}
  def self.of_dna(dna)
    rna = ''
    dna.chars do |char|
      raise ArgumentError if !DNA_RNA_HASH[char]
      rna += DNA_RNA_HASH[char]
    end
    rna
  end
end