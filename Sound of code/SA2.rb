require 'json'
use_osc "192.168.1.241", 4000
use_osc_logging false
use_debug false
use_cue_logging false
file_path = "/Users/kyle/Library/CloudStorage/GoogleDrive-fishiekai@gmail.com/My\ Drive/courses/cs\ 89/data.json"
file_content = File.read(file_path)
set_sched_ahead_time! 1

notes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
sleep_t = [0.125, 0.25, 0.5, 0.75, 1]
root_notes = [':c4', ':e7', ':g2']
high_notes = [':E4', ':Fs4', ':B4', ':Cs5',':D5', ':Fs4', ':E4', ':Cs5', ':B4', ':Fs4', ':D5', ':Cs5'].map(&:to_sym)
base_notes = [[':a2', ':d2', ':fs2'],
              [':bb2', ':ds2', ':g2'],
              [':cs2', ':f2', ':gs2'],
              [':a2', ':cs2', ':e2'],
              [':bb2', ':d2', ':f2'],
              [':b2', ':e2', ':gs2'],
              ]

in_thread do
  use_synth :beep
  live_loop :bg do
    s = rand(0..6)
    play (scale base_notes[s][0], :minor_pentatonic), attack: rand(5..10), release: 20, amp:0.75
    sleep [4, 5, 10, 12, 20].choose
    play (scale base_notes[s][1], :minor_pentatonic), attack: rand(5..10), release: 20, amp:0.75
    sleep [4, 5, 10, 12, 20].choose
    play (scale base_notes[s][2], :minor_pentatonic), attack: rand(5..10), release: 20, amp:0.75
    sleep [4, 5, 10, 12, 20].choose
  end
end

in_thread do
  use_synth :saw
  use_bpm 5
  use_debug false
  with_fx :reverb do
    with_fx :pitch_shift, pitch:5 do
      with_fx(:echo, delay: 0.5, decay: 4) do
        with_fx :level, amp: 0.1 do
          live_loop :echoes do
            play chord([:a1, :d1, :f1, :bb2, :d2, :g2,:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose, cutoff: rrand(20, 100), amp: 0.5, attack: 0, release: rrand(1, 50), cutoff_max: 110
            sleep [0.25, 0.5, 1, 5].choose
          end
        end
      end
    end
  end
end


in_thread do
  live_loop :low_bass do
    beat = [0.5,0.75]
    
    with_fx :echo do
      with_fx :level, amp:0.3 do
        with_fx :reverb, mix: 0.5, room: 0.9, damp: 0.5 do
          sample :bass_hit_c, beat_stretch:10
        end
      end
    end
    sleep beat.choose
  end
  
end

file_content.each_char do |char|
  puts char
  i = rand(6.11)
  j = rand(0..5)
  
  case char
  
  when /[a-z]/
    with_fx :echo, mix: 0.9, phase: 10, decay: 10 do
      with_fx :reverb, mix: 0.5, room: 0.4, damp: 0.1 do
        with_fx :mono do
          with_fx :panslicer do
            with_fx :level, amp: rand(0.5..2) do
              play (scale, root_notes[0], :minor_pentatonic)[notes[i]], release: 0.01
            end
          end
        end
      end
    end
    sleep sleep_t.choose
    
  when /[A-Z]/
    with_fx :echo, mix: 0.9, phase: 10, decay: 10 do
      with_fx :reverb, mix: 0.5, room: 0.4, damp: 0.1 do
        with_fx :mono do
          with_fx :panslicer do
            with_fx :level, amp: rand(0.5..2) do
              play (scale, root_notes[0], :minor_pentatonic)[notes[j]], release: 0.01
            end
          end
        end
      end
    end
    sleep sleep_t.choose
    
  when /\d/
    with_fx :level, amp: 0.3 do
      with_fx :reverb, mix: 0.5, room: 0.4, damp: 0.1 do
        with_fx :tanh do
          with_fx :pitch_shift, window_size: 0.1, pitch: 0 do
            with_fx :bitcrusher do
              play (scale, root_notes[1], :major)[notes[i]], release: 0.01
            end
          end
        end
      end
    end
    sleep sleep_t.choose
    
  when /\s/
    with_fx :echo, mix: 0.5, phase: 0.1, decay: 1 do
      with_fx :reverb, mix: 0.7, room: 0.4, damp: 0.9 do
        with_fx :mono do
          ##| sample :bd_808 , release: 0.1
          play (scale, root_notes[2], :major_pentatonic)[notes[j]], release: 0.05
        end
      end
    end
    sleep choose([0,0.125,0.25])
    
  when "<"
    play (chord, high_notes[4], :major), release: 0.08
    sleep sleep_t.choose
  when ">"
    play (chord, high_notes[1], :minor7), release: 0.08
    sleep sleep_t.choose
  when "{"
    play (chord, high_notes[2], :major7), release: 0.08
    sleep sleep_t.choose
  when "}"
    play (chord, high_notes[3], :minor7), release: 0.08
    sleep sleep_t.choose
  when "/"
    play (chord, high_notes[0], :maj11), release: 0.08
    sleep sleep_t.choose
  else
    with_fx :level, amp: 0.5 do
      with_fx :reverb, mix: 0.1, room: 0.2, damp: 0.1 do
        play (chord, high_notes[6], :minor7), release: 0.08
      end
    end
    sleep sleep_t.choose
    
  end
  
end


