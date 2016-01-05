class Hamming
  VERSION = 1
  def self.compute(sequence1,sequence2)
    dna1 = sequence1.chars
    dna2 = sequence2.chars
    raise ArgumentError if dna1.size != dna2.size
    
    hamming = 0
    dna1.size.times do |idx|
      hamming += 1 if dna1[idx] != dna2[idx]
    end
    hamming
  end
end