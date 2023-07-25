# markov model
violin1 = ["Cs4","B3","A3","A3","Gs3","Fs3","Fs3","E3","D3","D3","Cs3","B2","D4","Cs4","B3","B3","A3","Gs3","Gs3","Fs3","F3","F3","D3","Cs3","Cs3","B2","A2","B2","A2","B2","A2","B2","A2","B2","A2","B2","A2","B2","Gs2","A2","B2","C3","Cs3","Fs3","Fs3","Gs3","A3","D3","D3","E3","Fs3","Gs3","Gs3","A3","Gs3","B4","A4","Gs4","Gs4","Fs4","F4","F4","D4","Cs4","D4","Cs4","D4","Cs4","D4","Cs4","D4","Cs4","D4","Cs4","D4","C4","Cs4","B3","A3","Gs3","Cs4","D4","Cs4","B3","Cs4","A3","Cs4","Gs3","Cs4","Fs3","D4","Gs3","D4","Cs4","D4","B3","D4","A3","D4","Gs3","B3","Gs3","Cs3","F3","Gs3","Cs4","F3","Gs3","Cs4","Fs4","A4","Fs4","Cs4","A3","Fs3","Cs3","Fs3","A3","Cs3","Gs3","Cs3","Gs3","Cs3","Gs3","Cs3","Fs3","Cs3","F3","Cs3","F3","Cs3","F3","Cs3","Fs3","Fs3","Gs3","A3","B3","D4","Cs4","Cs5","B4","A4","Gs4","Fs4","D3","D3","B4","A4","Gs4","Fs4","E4","Cs3","Cs3","A4","Cs5","Fs4","A4","Cs4","Fs4","A3","C4","Fs3","A3","C3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","F3","Fs3","Cs3","Cs3","D3","Cs3","Cs3","Cs3","D3","D3","D3","D3","D3","Cs3","B2","B2","B2","B2","Cs3","Cs3","B2","C3","Cs3","Cs4","D4","Cs4","B3","Cs4","A3"]
violin1_t = ["0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.238","0.238","3.238","0.238","1.238","0.238","0.238","0.238","3.238","0.238","0.238","0.238","3.238","0.238","0.238","0.238","1.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.238","0.238","1.238","3.238","1.238","0.58","0.58","0.118","0.238","0.238","0.238","0.238","0.238","0.238","1.238","3.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","1.238","3.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.158","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238"]
violin2 = ["Fs3","Cs3","B2","Gs2","Gs3","Cs3","Cs3","Gs2","A2","Cs3","Fs3","D3","D3","Gs2","Cs4","B3","A3","A3","Gs3","Fs3","Fs3","E3","D3","D3","Cs3","B2","D4","Cs4","B3","B3","A3","Gs3","Gs4","Fs4","F4","F4","D4","Cs4","Cs4","B3","As3","B3","As3","B3","As3","B3","As3","B3","As3","B3","As3","B3","A3","As3","Gs3","C4","Cs4","Fs3","D4","E4","D4","Cs4","D4","B3","D4","A3","D4","Gs3","B3","Gs3","D4","Cs4","D4","B3","D4","A3","D4","A2","Cs3","F3","Fs3","A3","Fs3","D3","Cs3","Cs3","D3","Cs3","B2","Cs3","B2","A2","A2","B2","B2","D3","D3","A2","A2","Ds3","Cs4","Fs3","A3","Cs3","Fs3","A2","C3","Fs3","A3","C3","Fs3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","Cs3","Fs3","D4","E4","D4","Cs4","D4","B3","D4","A3","D4","Gs3","B3","Gs3","D4","Cs4","D4","B3","D4","A3","D4","A2","Cs3","F3","Fs3","A3","Fs3","D3","Cs3","Cs3","D3","Cs3","B2","Cs3","B2","A2","A2","B2","B2","D3","D3","A2","A2","Ds3","Cs4","Fs3","A3","Cs3","Fs3","A2","C3","Fs3","A3","C3","Fs3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","D3","Cs3","Gs3"]
violin2_t = ["0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","1.238","1.238","3.238","1.238","1.238","3.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.118","0.238","0.238","3.238","1.238","0.238","1.238","0.58","0.58","0.118","0.238","0.238","0.238","0.238","0.238","0.238","1.238","3.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","3.238","0.238","0.238","1.238","0.238","0.238","3.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.238","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","0.116","1.238","0.238","3.238","0.58","0.58","0.118","0.238","0.238","0.238","0.238","0.238","0.238","1.238","3.238","0.238"]
cello_t = ["3.238","3.238","3.238","3.238","3.238","3.238","3.238","1.238","2.238","0.238","0.238","1.238","1.238","0.238","0.238"]

violin1 = violin1.map { |note_name| note note_name }
violin2 = violin2.map { |note_name| note note_name }

use_random_seed 999
use_synth :piano

define :build_markov_model do |x|
  
  model = {}
  (x.length - 1).times do |i|
    switch = true
    long_count = 1
    while switch do
      context = x[i]
      next_note = x[i + long_count]
      if (x[i].to_f > 1 && x[i + long_count].to_f > 1)
        long_count+=1
      else
        switch = false
      end
    end
    
    if model.include?(context)
      model[context].append(next_note)
    else
      model[context] = [next_note]
    end
  end
  model
end

define :build_markov_model_2 do |x1,x2|
  switch = true
  model1 = {}
  model2 = {}
  (x2.length - 1).times do |i|
    
    context_v1 = x1[i]
    context_v2 = x2[i]
    next_note_v1 = x1[i + 1]
    next_note_v2 = x2[i + 1]
    
    if not (
        (context_v1-next_note_v1 % 4 == 0 && context_v1-next_note_v1 % 4 == 0) ||
        (context_v1-next_note_v1 % 7 == 0 && context_v1-next_note_v1 % 7 == 0) ||
        (next_note_v1-next_note_v2 % 12 == 1 || next_note_v1-next_note_v2 % 12 == 11 ) && (next_note_v1-next_note_v2 % 12 == 6) ||
        (next_note_v1-next_note_v2 % 4 == 0 || next_note_v1-next_note_v2 % 7 == 0)
      )
      
      if model1.include?(context_v1)
        model1[context_v1].append(next_note_v1)
      else
        model1[context_v1] = [next_note_v1]
      end
      
      if model2.include?(context_v2)
        model2[context_v2].append(next_note_v2)
      else
        model2[context_v2] = [next_note_v2]
      end
      switch = false
      
    end
    
  end
  return model1, model2
end

model1, model2 = build_markov_model_2(violin1, violin2)
model1_t = build_markov_model(violin1_t)
model2_t = build_markov_model(violin2_t)
model3_t = build_markov_model(cello_t)

note1 = violin1[0]
note2 = violin2[0]

t1 = '0.238'
t2 = '0.238'
t3 = '3.238'

bpm = rand(10..100)

in_thread do
  live_loop :markov1 do
    
    use_bpm bpm
    bpm += rand(30..120) + rand(-10..10)
    if(bpm > 30)
      bpm -= rand(40..120)
      if bpm < 10
        bpm = 10
      end
    end
    play note1, decay:t1.to_f*bpm*0.02
    note1 = model1[note1].choose
    t1 = model1_t[t1].choose
    sleep (t1.to_f)
  end
end

in_thread do
  live_loop :markov2 do
    play note2, decay:t2.to_f*bpm*0.02, amp:0.8
    note2 = model2[note2].choose
    t2 = model2_t[t2].choose
    sleep (t2.to_f)
  end
end


class LSystem
  attr_accessor :axiom, :rules, :iterations
  
  def initialize(axiom, rules, iterations)
    @axiom = axiom
    @rules = rules
    @iterations = iterations
  end
  
  def generate_sequence
    current_sequence = @axiom
    
    @iterations.times do
      next_sequence = ''
      
      current_sequence.each_char do |symbol|
        next_sequence += (@rules[symbol] || symbol)
      end
      
      current_sequence = next_sequence
    end
    
    current_sequence
  end
end

axiom = 'A'
rules = {
  'A' => 'AB',
  'B' => 'BC',
  'C' => 'CD',
  'D' => 'DE',
  'E' => 'EF',
  'F' => 'FG',
  'G' => 'GH',
  'H' => 'HI',
  'I' => 'IJ',
  'J' => 'JK',
  'K' => 'KL',
  'L' => 'LM',
  'M' => 'MN',
  'N' => 'NO',
  'O' => 'OP',
  'P' => 'PQ',
  'Q' => 'QR',
  'R' => 'RS',
  'S' => 'ST',
  'T' => 'TU',
  'U' => 'UV',
  'V' => 'VW',
  'W' => 'WX',
  'X' => 'XY',
  'Y' => 'YZ',
  'Z' => 'ZA'
}

iterations = 10

l_system = LSystem.new(axiom, rules, iterations)
sequence = l_system.generate_sequence

cello = ["A2", "D3", "B2", "F2", "Gs2", "Fs2", "Cs2", "F1", "Gs1", "E1", "Ds1", "D1", "Cs1", "C2", "A1", "Fs1", "C1", "Ds2", "F3", "Fs3", "Gs3", "As2"]
unique_cello = cello.uniq
cello_hash = Hash[unique_cello.each_with_index.map { |note, index| [(index + 65).chr, note] }]
note_map = cello_hash

notes = sequence.chars.map { |symbol| note_map[symbol] }

in_thread do
  live_loop :cello do
    notes.each do |note|
      play note, amp:0.2, decay:(t3.to_f)*0.5
      t3 = model3_t[t3].choose
      sleep (t3.to_f)
    end
  end
end

