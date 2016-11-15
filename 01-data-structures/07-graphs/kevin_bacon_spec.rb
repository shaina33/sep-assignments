include RSpec

require_relative 'kevin_bacon'

RSpec.describe KevinBaconGraph, type: Class do
  let(:kevin) { Node.new("Kevin Bacon") }
  let(:benedict) { Node.new("Benedict Cumberbatch") }
  let(:whoever) { Node.new("Whichever Person") }
  
  let(:test_array) { [kevin, benedict, whoever] }
  let(:graph) { KevinBaconGraph.new(test_array) }
  
  before do
    kevin.film_actor_hash["Black Mass"] = [benedict]
    benedict.film_actor_hash["Black Mass"] = [kevin]
    benedict.film_actor_hash["A movie"] = [whoever]
    whoever.film_actor_hash["A movie"] = [benedict]
  end
  
  describe '#find_kevin_bacon' do
      it 'finds kevin with three nodes' do
          expect(graph.find_kevin_bacon(whoever)).to eq ["Whichever Person", "Benedict Cumberbatch", "Kevin Bacon"]
      end
  end
  
end # RSpec

