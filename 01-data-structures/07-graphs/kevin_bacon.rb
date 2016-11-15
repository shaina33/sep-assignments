require_relative 'node'

class KevinBaconGraph
    
    def initialize(array)
        # array of actor nodes
        @actors = array
    end
    
    def resetTable
        @table = Hash.new
        @actors.each do |actor|
            @table[actor.name] = [ -1, [] ]
        end
        # @table[node.name][0] -> a number representing the distance to the start node
        # @table[node.name][1] -> an array of movie titles representing the path from the start node
    end
    
    def find_kevin_bacon(start)
        resetTable()
        q = Queue.new
        q << start
        @table[start.name][0] = 0
        while !q.empty?
            v = q.pop()
            v.film_actor_hash.each do |movie, actor_list| # each movie entry
                actor_list.each do |w|                    # each adjacent actor node w
                
                    if @table[w.name][0] == -1
                        # calculate node distance, finish if we've gone beyond 6 steps
                        @table[w.name][0] = @table[v.name][0] + 1
                        if @table[w.name][0] > 6
                            return nil
                        end
                        
                        # save path to w, return the path if w is Kevin Bacon
                        @table[w.name][1] = @table[v.name][1] << v.name
                        if w.name == "Kevin Bacon"
                            @table[w.name][1] << w.name
                            return @table[w.name][1]
                        end
                        
                        # add w to the end of the queue
                        q << w
                    end
                end
            end
        end
    end
   
end
        
    