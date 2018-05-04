class QLearner
  def author
    'Your Name Here'
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
  end

  # Update the state without learning.
  # @param s: The new state
  # @return:  The selected action
  def querysetstate(s)
  end

  # Update your state, learn, and return a new action
  # @param s_prime: The new state
  # @param r:       The previous reward
  # @return:        The selected action
  def query(s_prime,r)
  end
end
