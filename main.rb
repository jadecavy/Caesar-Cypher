def caesar_cipher(string, shift)
  if not shift.is_a?(Integer) then
    return "Shift parameter must be a number"
  elsif shift < 0 || shift > 26 then 
    return "Shift perameter must be between 0 and 25"
  end
  
  count = shift
  key = []
  encrypted = []
  while key.length < 25
    'a'.each_byte do |char| 
      letter = char + count
      key << letter.chr
    end
    count += 1
    count = 0 if count > 25
  end
  
  string.split("").each do |c|
    upper = false
    if c.match?(/^[[:alpha:]]+$/)
      isUpper=true if /[[:upper:]]/.match?(c)
      c.downcase.each_byte do |k| 
        isUpper ? encrypted << key[k-97].upcase : encrypted << key[k-97]
      end
    else
      encrypted << c
    end
  end

  encrypted = encrypted.join("")
  encrypted
end