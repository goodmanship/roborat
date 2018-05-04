class QLearner
  def author
    'Mister Broboto'
  end

  # Setup your initial state here.
  # Num States: each state in the environment (maze) is represented by a single integer (0..99).
  # Num Actions: the learner can move in four directions.
  # Alpha: learning rate
  # Gamma: discount rate
  # RAR: initial rate of random action
  # RADR: rate of decay of random action
  # Dyna: how many experiences to 'relive' after a query
  # Verbose: if this is true you can `puts` whatever you want.
  def initialize(num_states: 100, num_actions: 4, alpha: 0.2, gamma: 0.9, rar: 0.5, radr: 0.99, dyna: 0, verbose: false)
    @states = Array.new(num_states)
    @actions = Array.new(num_actions)
    @alpha = alpha
    @gamma = gamma
    @rar = rar
    @radr = radr
    @dyna = dyna
    @verbase = verbose
    @q = (0..99).map{|_| (0..3).map{|_| 0}}

    @past = []
    # @q = {}
    # 100.times do |s|
    #   @q[s] = {}
    #   4.times {|a| @q[s][a] = 0}
    # end
  end

  # Update the state without learning.
  # @param s: The new state
  # @return:  The selected action
  def querysetstate(s)
    @s = s
    @a = rand(4)
  end

  def argmax(s)
    @q[s].each_with_index.max.last
  end

  def update_q(s, a, s_prime, r)
    a_prime = argmax(s_prime)

    @q[s][a] =
      (1 - @alpha)*@q[s][a] +
      @alpha*(r + @gamma*(@q[s_prime][a_prime]))

    [s_prime, a_prime]
  end

  # Update your state, learn, and return a new action
  # @param s_prime: The new state
  # @param r:       The previous reward
  # @return:        The selected action
  def query(s_prime, r)
    s_prime, a_prime = update_q(@s, @a, s_prime, r)

    if @dyna >= @past.length
      @past.each {|s, a, s_prime, r| update_q(s, a, s_prime, r)}
    else
      @past.sample(@dyna).each {|s, a, s_prime, r| update_q(s, a, s_prime, r)}
    end

    @past << [@s, @a, s_prime, r]

    @s = s_prime
    @a = a_prime
  end
end
