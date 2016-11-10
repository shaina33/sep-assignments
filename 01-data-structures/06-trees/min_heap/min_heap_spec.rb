include RSpec

require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
    let (:imitation) { Node.new('The Imitation Game', 90) }
    let (:heap) { MinHeap.new(imitation) }
    
    let (:nice_guys) { Node.new("The Nice Guys", 92) }
    let (:planet_apes) { Node.new("Planet of the Apes", 91) }
    let (:walking_dead) { Node.new("The Walking Dead", 84) }
    let (:star_trek) { Node.new("Star Trek", 95) }
    let (:mulan) { Node.new("Mulan", 86) }
    let (:pocahontas) { Node.new("Pocahontas", 56) }
    let (:pirates) { Node.new("Pirates of the Caribbean", 79) }
    let (:westworld) { Node.new("Westworld", 89) }
    let (:brooklyn99) { Node.new("Brooklyn 99", 94) }
    let (:gilmore) { Node.new("Gilmore Girls", 87) }
    let (:step_up) { Node.new("Step Up", 19) }
    
    # describe '#insert(node)' do
    #     it 'adds nodes correctly' do
    #         heap.insert(nice_guys)
    #         heap.insert(planet_apes)
    #         heap.insert(walking_dead)
    #         heap.insert(star_trek)
    #         heap.insert(mulan)
    #         heap.insert(pocahontas)
    #         heap.insert(pirates)
    #         heap.insert(westworld)
    #         heap.insert(brooklyn99)
    #         heap.insert(gilmore)
    #         heap.insert(step_up)
    #         heap.print()
    #     end
    # end
    
    describe '#findIndex' do
        it 'finds a node index correctly' do
            heap.insert(nice_guys)
            heap.insert(planet_apes)
            heap.insert(walking_dead)
            heap.insert(star_trek)
            expect(heap.findIndex('Star Trek')).to eq 5
        end
    end
    
    describe '#findNode' do
        it 'finds a node correctly' do
            heap.insert(nice_guys)
            heap.insert(planet_apes)
            heap.insert(walking_dead)
            heap.insert(star_trek)
            expect(heap.findNode('Star Trek').title).to eq "Star Trek"
        end
    end
    
#     describe '#delete(node)' do    
#         it 'deletes root node correctly' do 
#             heap.insert(nice_guys)
#             heap.insert(planet_apes)
#             heap.insert(walking_dead)
#             heap.insert(star_trek)
#             heap.insert(mulan)
#             heap.insert(pocahontas)
#             heap.insert(pirates)
#             heap.insert(westworld)
#             heap.insert(brooklyn99)
#             heap.insert(gilmore)
#             heap.insert(step_up)
#             heap.delete(step_up)
#             heap.print()
#             expect(heap.root.rating).to eq 56
#         end
#         it 'deletes other node correctly' do 
#             heap.insert(nice_guys)
#             heap.insert(planet_apes)
#             heap.insert(walking_dead)
#             heap.insert(star_trek)
#             heap.insert(mulan)
#             heap.insert(pocahontas)
#             heap.insert(pirates)
#             heap.insert(westworld)
#             heap.insert(brooklyn99)
#             heap.insert(gilmore)
#             heap.insert(step_up)
#             heap.delete(pirates)
#             heap.print()
#             expect(heap.root.rating).to eq 19
#             expect(heap.items[5].rating).to eq 91
#         end
#     end
 end

