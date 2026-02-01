#import "../src/lib.typ": (
  dtu-physics-note,
  law,
  principle,
  phenomenon,
  observation,
  intuition,
  misconception,
  vector-diagram,
  limiting-case,
  dimensional-analysis,
  unit-def,
  constant,
  key-equation,
  derivation,
  definition,
  theorem,
  example,
  important,
  note-box,
)

// Import physics packages for notation
#import "@preview/physica:0.9.4": *
#import "@preview/unify:0.7.1": qty, unit, num

#show: dtu-physics-note.with(
  course: "10036",
  course-name: "Physics 1",
  title: "Lecture 5: Newton's Laws of Motion",
  date: datetime(year: 2024, month: 3, day: 15),
  author: "Student Name",
  semester: "Spring 2024",
  textbook-reference: "OpenStax Physics Vol. 1, Chapters 5-6",
)

= Newton's Laws of Motion

This lecture covers the fundamental laws that govern the motion of objects under the influence of forces.

== Historical Context

Isaac Newton published his three laws of motion in _Philosophiæ Naturalis Principia Mathematica_ (1687). These laws form the foundation of classical mechanics and remain accurate for everyday objects moving at speeds much less than the speed of light.

== The Three Laws

#law(
  name: "Newton's First Law (Law of Inertia)",
)[
  An object at rest stays at rest, and an object in motion stays in motion with the same speed and direction, unless acted upon by an unbalanced force.

  $ sum va(F) = 0 arrow.r.double va(v) = "constant" $
]

#intuition[
  This law defines what a force does: it *changes* motion. Without a net force, there is no change in velocity. A hockey puck sliding on ice continues moving not because of a force pushing it forward, but because there's minimal friction to slow it down.
]

#law(
  name: "Newton's Second Law",
)[
  The acceleration of an object is directly proportional to the net force acting on it and inversely proportional to its mass.

  $ va(F)_"net" = m va(a) $

  Or in terms of momentum: $va(F) = dv(va(p), t)$
]

#key-equation(name: "Newton's Second Law - Component Form")[
  $ sum F_x = m a_x, quad sum F_y = m a_y, quad sum F_z = m a_z $
]

#misconception[
  *"Heavier objects fall faster"* — In the absence of air resistance, all objects fall with the same acceleration $g$ regardless of mass. A feather and a hammer dropped on the Moon (no atmosphere) hit the ground at the same time.
]

#law(
  name: "Newton's Third Law",
)[
  For every action, there is an equal and opposite reaction. When object A exerts a force on object B, object B simultaneously exerts an equal and opposite force on object A.

  $ va(F)_(A "on" B) = -va(F)_(B "on" A) $
]

#misconception[
  *"Action-reaction forces cancel out"* — The forces act on *different* objects, so they cannot cancel. The Earth pulls you down (gravity), and you pull the Earth up with equal force — but these forces act on different objects!
]

== Units and Dimensions

#unit-def("Force", "F", "N = kg·m/s²")
#unit-def("Mass", "m", "kg")
#unit-def("Acceleration", "a", "m/s²")

#dimensional-analysis[
  Verifying $F = m a$:
  $ [F] = [m][a] = "kg" dot "m"/"s"^2 = "N" checkmark $
]

== Types of Forces

=== Contact Forces

#definition(
  title: "Normal Force",
)[
  The perpendicular contact force exerted by a surface on an object. It adjusts to prevent objects from passing through surfaces.
  $ N = m g cos theta quad "(on an inclined plane)" $
]

#definition(title: "Friction")[
  The force that opposes relative motion between surfaces in contact.
  - *Static friction*: $f_s <= mu_s N$ (prevents motion)
  - *Kinetic friction*: $f_k = mu_k N$ (opposes motion)
]

#definition(
  title: "Tension",
)[
  The pulling force transmitted through a string, rope, or cable. For a massless, inextensible string, tension is the same throughout.
]

=== Non-Contact Forces

#definition(title: "Gravitational Force (Weight)")[
  The attractive force between masses. Near Earth's surface:
  $ va(W) = m va(g), quad "where" g = qty("9.81", "m/s^2") $
]

== Free Body Diagrams

#vector-diagram(description: "Block on Inclined Plane")[
  For a block of mass $m$ on a frictionless incline at angle $theta$:

  *Forces present:*
  - Weight $va(W) = m va(g)$ (vertically downward)
  - Normal force $va(N)$ (perpendicular to surface)

  *Component decomposition:*
  - Parallel to incline: $m g sin theta$ (causes acceleration)
  - Perpendicular to incline: $m g cos theta$ (balanced by $N$)
]

== Solving Problems with Newton's Laws

=== General Strategy

1. *Identify the system* — What object(s) are you analyzing?
2. *Draw a free body diagram* — Show all forces acting on the object
3. *Choose a coordinate system* — Often aligned with acceleration direction
4. *Apply Newton's Second Law* — Write $sum F = m a$ for each direction
5. *Solve the equations* — Use algebra to find unknowns
6. *Check your answer* — Verify units and limiting cases

=== Example: Atwood Machine

#example(title: "Atwood Machine")[
  Two masses $m_1$ and $m_2$ ($m_2 > m_1$) are connected by a string over a massless, frictionless pulley.

  #derivation(title: "Finding the acceleration")[
    For mass $m_1$ (accelerating upward):
    $ T - m_1 g = m_1 a $

    For mass $m_2$ (accelerating downward):
    $ m_2 g - T = m_2 a $

    Adding the equations:
    $ m_2 g - m_1 g = (m_1 + m_2) a $

    $ a = (m_2 - m_1)/(m_1 + m_2) g $
  ]

  #limiting-case(case-name: "$m_1 = m_2$")[
    When the masses are equal: $a = 0$. The system is balanced!
  ]

  #limiting-case(case-name: "$m_2 >> m_1$")[
    When $m_2$ is much larger: $a arrow g$. Mass $m_2$ falls freely.
  ]
]

== Important Phenomena

#phenomenon(name: "Apparent Weight in an Elevator")[
  When an elevator accelerates upward, you feel heavier. When it accelerates downward, you feel lighter.

  $ N = m(g + a) quad "(upward acceleration)" $
  $ N = m(g - a) quad "(downward acceleration)" $

  In free fall ($a = g$): $N = 0$ — you feel weightless!
]

#observation[
  Astronauts on the ISS experience "weightlessness" not because there's no gravity (gravity is about 90% of surface value at ISS altitude), but because they're in continuous free fall around the Earth.
]

== Fundamental Constants

#constant("g", "Standard gravitational acceleration", $qty("9.80665", "m/s^2")$)
#constant("G", "Universal gravitational constant", $qty("6.674e-11", "N m^2/kg^2")$)

== Summary

#important[
  *Key Takeaways:*
  - Newton's First Law defines inertia — objects resist changes in motion
  - Newton's Second Law quantifies how forces cause acceleration: $va(F) = m va(a)$
  - Newton's Third Law: forces come in action-reaction pairs on different objects
  - Always draw free body diagrams before solving problems
  - Check limiting cases to verify your solutions make physical sense
]

#note-box[
  *Next Lecture:* Applications of Newton's Laws — friction, circular motion, and drag forces.

  *Recommended Problems:* OpenStax Physics Vol. 1, Chapter 5: Problems 15, 23, 31, 45
]
