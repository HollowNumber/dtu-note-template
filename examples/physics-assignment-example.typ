#import "../src/lib.typ": dtu-physics-assignment, physical-law, derivation, experiment, physics-given, physics-find, physics-solution, free-body-diagram, constant, unit-analysis, physics-problem, conceptual-question, assumption, final-result, physics-hint, key-equation, definition, theorem, important, note-box

// Import physics packages for notation
#import "@preview/physica:0.9.4": *
#import "@preview/unify:0.7.1": qty, unit, num

#show: dtu-physics-assignment.with(
  course: "10036",
  course-name: "Physics 1",
  title: "Assignment 3: Newton's Laws and Applications",
  due-date: datetime(year: 2026, month: 4, day: 20),
  author: "Your Name",
  semester: "Spring 2026",
  textbook-chapter: "OpenStax Physics Vol. 1, Chapters 5-6"
)

= Newton's Laws of Motion

This assignment covers fundamental concepts from classical mechanics, focusing on force analysis and applications of Newton's laws.

#physical-law(name: "Newton's Second Law")[
  The acceleration of an object is directly proportional to the net force acting on it and inversely proportional to its mass:
  $ va(F)_"net" = m va(a) $
  Or equivalently: $sum va(F) = m dv(va(v), t)$
]

== Problem Set

#physics-problem(number: "1", points: "20", topic: "Force Analysis")[
  A block of mass $m = qty("5.0", "kg")$ rests on a frictionless inclined plane that makes an angle $theta = 30degree$ with the horizontal. The block is connected by a massless string over a frictionless pulley to a hanging mass $M = qty("3.0", "kg")$.

  Determine:
  + The acceleration of the system
  + The tension in the string
]

#physics-given[
  - Block on incline: $m = qty("5.0", "kg")$
  - Hanging mass: $M = qty("3.0", "kg")$
  - Incline angle: $theta = 30degree$
  - Frictionless surfaces and pulley
  - $g = qty("9.81", "m/s^2")$
]

#physics-find[
  + Acceleration of the system, $a$
  + Tension in the string, $T$
]

#assumption[
  - The string is inextensible (both masses have the same magnitude of acceleration)
  - Air resistance is negligible
  - The pulley is massless and frictionless
]

#free-body-diagram(description: "Block on incline")[
  Forces acting on mass $m$:
  - Weight component parallel to incline: $m g sin theta$ (down the incline)
  - Weight component perpendicular: $m g cos theta$ (into the surface)
  - Normal force: $N$ (perpendicular to surface, outward)
  - Tension: $T$ (up the incline, along string)
]

#physics-solution[
  *Step 1: Set up coordinate systems*

  For the block on the incline, we choose the positive direction to be up the incline.
  For the hanging mass, positive is downward (consistent with the string constraint).

  *Step 2: Apply Newton's Second Law to each mass*

  For mass $m$ on the incline:
  $ T - m g sin theta = m a $

  For hanging mass $M$:
  $ M g - T = M a $

  *Step 3: Solve the system of equations*

  Adding the two equations to eliminate $T$:
  $ M g - m g sin theta = (m + M) a $

  #derivation(title: "Acceleration")[
    $ a = (M g - m g sin theta) / (m + M) = (g(M - m sin theta)) / (m + M) $

    Substituting values:
    $ a = (qty("9.81", "m/s^2")(qty("3.0", "kg") - qty("5.0", "kg") times sin 30 degree)) / (qty("5.0", "kg") + qty("3.0", "kg")) $

    $ a = (qty("9.81", "m/s^2")(3.0 - 2.5)) / (8.0) = (qty("9.81", "m/s^2") times 0.5) / 8.0 $

    $ a = qty("0.61", "m/s^2") $
  ]

  *Step 4: Find the tension*

  Using the equation for the hanging mass:
  $ T = M g - M a = M(g - a) $

  $ T = qty("3.0", "kg") (qty("9.81", "m/s^2") - qty("0.61", "m/s^2")) = qty("3.0", "kg") times qty("9.20", "m/s^2") $
]

#final-result[
  $ a = qty("0.61", "m/s^2") $
  $ T = qty("27.6", "N") $
]

#unit-analysis[
  Acceleration: $[a] = [g] = "m/s"^2$ ✓

  Tension: $[T] = [M][g] = "kg" dot "m/s"^2 = "N"$ ✓
]

#physics-problem(number: "2", points: "25", topic: "Circular Motion")[
  A car of mass $m = qty("1200", "kg")$ travels around a banked curve of radius $r = qty("50", "m")$. The road is banked at an angle $theta = 15degree$.

  + At what speed can the car navigate the curve without any friction?
  + If the coefficient of static friction is $mu_s = 0.3$, what is the maximum speed?
]

#key-equation(name: "Centripetal Acceleration")[
  $a_c = v^2 / r$
]

#physics-given[
  - Mass: $m = qty("1200", "kg")$
  - Radius: $r = qty("50", "m")$
  - Banking angle: $theta = 15degree$
  - Static friction coefficient: $mu_s = 0.3$
]

#physics-solution[
  *Part (a): No friction case*

  On a banked curve without friction, the horizontal component of the normal force provides the centripetal force.

  Force balance equations:
  - Vertical: $N cos theta = m g$
  - Horizontal (centripetal): $N sin theta = (m v^2) / r$

  Dividing the equations:
  $ tan theta = v^2 / (r g) $

  $ v = sqrt(r g tan theta) = sqrt(qty("50", "m") times qty("9.81", "m/s^2") times tan 15 degree) $

  $ v = sqrt(50 times 9.81 times 0.268) = sqrt(131.4) = qty("11.5", "m/s") $

  #final-result[
    $v_"no friction" = qty("11.5", "m/s") approx qty("41", "km/h")$
  ]

  *Part (b): Maximum speed with friction*

  At maximum speed, friction acts down the incline (preventing the car from sliding up).

  #important[
    When speed exceeds the no-friction design speed, friction must point down the incline to provide additional centripetal force.
  ]

  Force equations:
  - Vertical: $N cos theta - f sin theta = m g$
  - Horizontal: $N sin theta + f cos theta = (m v^2) / r$

  At maximum speed: $f = mu_s N$

  Solving (detailed algebra omitted):
  $ v_"max" = sqrt((r g (sin theta + mu_s cos theta)) / (cos theta - mu_s sin theta)) $

  $ v_"max" = sqrt((50 times 9.81 times (sin 15 degree + 0.3 cos 15 degree)) / (cos 15 degree - 0.3 sin 15 degree)) $

  $ v_"max" = sqrt((490.5 times (0.259 + 0.290)) / (0.966 - 0.078)) = sqrt((269.1) / (0.888)) $

  #final-result[
    $v_"max" = qty("17.4", "m/s") approx qty("63", "km/h")$
  ]
]

#physics-problem(number: "3", points: "15", topic: "Work and Energy")[
  A spring with spring constant $k = qty("200", "N/m")$ is compressed by $x = qty("0.15", "m")$ and used to launch a ball of mass $m = qty("0.050", "kg")$ vertically upward.

  Assuming no energy losses, find the maximum height reached by the ball above its starting position.
]

#physical-law(name: "Conservation of Mechanical Energy")[
  In the absence of non-conservative forces:
  $ E_"initial" = E_"final" $
  $ K_i + U_i = K_f + U_f $
]

#physics-solution[
  Initial state: Spring compressed, ball at rest at $h = 0$
  Final state: Ball at maximum height $h_"max"$, momentarily at rest

  Energy conservation:
  $ 1/2 k x^2 + 0 = 0 + m g h_"max" $

  Solving for $h_"max"$:
  $ h_"max" = (k x^2) / (2 m g) $

  $ h_"max" = (qty("200", "N/m") times (qty("0.15", "m"))^2) / (2 times qty("0.050", "kg") times qty("9.81", "m/s^2")) $

  $ h_"max" = (200 times 0.0225) / (0.981) = 4.5 / 0.981 $

  #final-result[
    $h_"max" = qty("4.59", "m")$
  ]
]

#conceptual-question[
  *Thought Exercise:* If the spring were oriented horizontally instead of vertically, how would you modify the energy conservation equation? What additional considerations would be needed?

  _Hint: Consider when the ball leaves contact with the spring and how gravitational potential energy changes during compression._
]

#physics-hint[
  For horizontal launch problems, remember that the ball continues to gain height even after leaving the spring, so you must track the projectile motion phase separately.
]

= Constants Reference

#constant("g", "Acceleration due to gravity (Earth surface)", $qty("9.81", "m/s^2")$)
#constant("G", "Universal gravitational constant", $qty("6.674e-11", "N m^2/kg^2")$)
#constant("c", "Speed of light in vacuum", $qty("2.998e8", "m/s")$)

---

#important[
  *Submission Guidelines:*
  - Show all steps in your derivations
  - Include free body diagrams where appropriate
  - Check your answers using dimensional analysis
  - Express final answers with appropriate significant figures and units
  - Verify results are physically reasonable
]

#note-box[
  *Study Resources:*
  - OpenStax Physics Vol. 1, Chapters 5-6
  - Practice with varied friction and incline problems
  - Review vector decomposition techniques
]
