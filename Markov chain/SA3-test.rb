require 'json'

file_path1 = "/Users/kyle/Library/CloudStorage/GoogleDrive-fishiekai@gmail.com/My\ Drive/courses/cs\ 89/SA3/data_note.json"
file_content1 = File.read(file_path1)
file_content1 = JSON.parse(file_content1)

file_path2 = "/Users/kyle/Library/CloudStorage/GoogleDrive-fishiekai@gmail.com/My\ Drive/courses/cs\ 89/SA3/data_t_v1.json"
file_content2 = File.read(file_path2)
file_content2 = JSON.parse(file_content2)

file_path3 = "/Users/kyle/Library/CloudStorage/GoogleDrive-fishiekai@gmail.com/My\ Drive/courses/cs\ 89/SA3/data_t_v2.json"
file_content3 = File.read(file_path3)
file_content3 = JSON.parse(file_content3)

file_path4 = "/Users/kyle/Library/CloudStorage/GoogleDrive-fishiekai@gmail.com/My\ Drive/courses/cs\ 89/SA3/data_t_c.json"
file_content4 = File.read(file_path4)
file_content4 = JSON.parse(file_content4)

violin1_note = file_content1["violin1"]
violin2_note = file_content1["violin2"]
cello_note = file_content1["cello"]

violin1_t = file_content2["violin1"]
violin2_t = file_content3["violin2"]
cello_t = file_content4["cello"]

set_sched_ahead_time! 1



violin1 = violin1_note.map { |note_name| note note_name }
violin2 = violin1_note.map { |note_name| note note_name }
cello = cello_note.map { |note_name| note note_name }

use_random_seed 66234
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
    
    interval = (next_note_v1 - next_note_v2).abs
    prev_interval = (context_v1 - context_v2).abs
    
    if not(
        (context_v1-next_note_v1 % 4 == 0 && context_v2-next_note_v2 % 4 == 0) ||
        (context_v1-next_note_v1 % 7 == 0 && context_v2-next_note_v2 % 7 == 0) ||
        (next_note_v1-next_note_v2 % 12 == 1 && next_note_v1-next_note_v2 % 12 == 11 ) ||
        ((context_v1-next_note_v2 % 12 == 0 && context_v1-next_note_v2 % 12 == 11 )) && (next_note_v1-next_note_v2 % 12 == 1) ||
        ((context_v2-next_note_v1 % 12 == 0 && context_v2-next_note_v1 % 12 == 11 )) && (context_v2-next_note_v1 % 12 == 1)
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

model1, model2 = build_markov_model_2(violin1, cello)
model1_t = build_markov_model(violin1_t)
model2_t = build_markov_model(cello_t)

print(model1)
print(model2)

note1 = violin1[0]
note2 = cello[0]
t1 = '0.238'
t2 = '0.238'
t3 = '3.238'

bpm = rand(0..200)
r_bpm = rand(10..50)

live_loop :markov1 do
  use_bpm bpm
  bpm += rand(0..100) + rand(-5..5)
  print("bpm: "+bpm.to_s)
  
  in_thread do
    sleep (t1.to_f)
    play note1, decay:t1.to_f*0.5*bpm*0.01, release:1/t1.to_f
    note1 = model1[note1].choose
    while model1_t[t1] == nil
      t1 = violin1_t.choose
    end
    t1 = model1_t[t1].choose
    
  end
  
  
  in_thread do
    sleep (t2.to_f)
    play note2, amp:0.6, decay:t1.to_f*0.5*bpm*0.01, release:1/t2.to_f
    note2 = model2[note2].choose
    t2 = model2_t[t2].choose
    
    while model2_t[t2] == nil
      t2 = cello_t.choose
    end
    t2 = model2_t[t2].choose
  end
  
  sleep t1.to_f
  
  if(bpm > 30)
    bpm -= rand(40..100)
    if bpm < 15
      bpm = r_bpm
    end
  end
  
end

