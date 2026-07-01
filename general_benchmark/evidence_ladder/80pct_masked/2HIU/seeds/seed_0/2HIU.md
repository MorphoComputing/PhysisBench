# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2HIU/sequence/2HIU.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2HIU/seeds/seed_0/2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 7.185 A
- tm_score_ca_ordered: 0.15508842190868555
- heavy_atom_rmsd: 8.433 A
- sidechain_heavy_atom_rmsd: 9.401 A
- **all-atom quality (honest):** heavy 8.433 A, sidechain 9.401 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 198
- bin_accuracy: 0.364

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.184608264586825
- ga_delta_rmsd: -0.34918837368218103  ga_fitness_mode: energy
- pre_local_rmsd: 7.191550743250846  localized_anchor_rmsd: 7.1845552271319155

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25-Y34 → 33 conflicts (80%)
- explained: 33/41 conflicts by 1 root cause(s)
- metrics: hubs=23 (frac 0.489), conflicts/hub=1.8, max_incompat=6.5Å, chain_span=0.894
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25-Y34 — explain ~33/41 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G26** — severity 6.84, 3 conflict(s); suspect input ~`R40` (group: push_out)
  - push-out (wants farther): E39@18.2Å(now 13.7,conf 0.55), R40@18.1Å(now 10.7,conf 0.55), Y13@16.6Å(now 7.2,conf 0.55), Y18@13.0Å(now 7.9,conf 0.55), S11@13.8Å(now 6.2,conf 0.55)
  - V30↔R40: targets 5.6/18.1Å but partners are 6.5Å apart → too_close_together by 6.0Å
  - V30↔E39: targets 5.6/18.2Å but partners are 9.1Å apart → too_close_together by 3.4Å
  - R40↔Y34: targets 18.1/11.3Å but partners are 3.7Å apart → too_close_together by 3.1Å
- **Y13** — severity 6.05, 5 conflict(s); suspect input ~`V36` (group: push_out)
  - push-out (wants farther): P46@17.4Å(now 14.1,conf 0.55), G26@16.6Å(now 7.2,conf 0.55), N21@11.2Å(now 5.3,conf 0.55), Q22@13.3Å(now 5.6,conf 0.55), L29@12.7Å(now 9.0,conf 0.55), V30@14.6Å(now 10.4,conf 0.55)
  - G26↔V36: targets 16.6/8.5Å but partners are 4.8Å apart → too_close_together by 3.2Å
  - G26↔L33: targets 16.6/9.9Å but partners are 4.4Å apart → too_close_together by 2.3Å
  - V30↔V36: targets 14.6/8.5Å but partners are 3.8Å apart → too_close_together by 2.2Å
- **C25** — severity 5.83, 5 conflict(s); suspect input ~`L12` (group: push_out)
  - pull-in (wants closer): H28@5.3Å(now 8.8,conf 0.56)
  - push-out (wants farther): L12@14.0Å(now 8.2,conf 0.55)
  - H28↔L35: targets 5.3/14.6Å but partners are 6.2Å apart → too_close_together by 3.1Å
  - H28↔L12: targets 5.3/14.0Å but partners are 6.6Å apart → too_close_together by 2.2Å
  - C6↔L12: targets 4.1/14.0Å but partners are 7.8Å apart → too_close_together by 2.2Å
- **C6** — severity 4.80, 2 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@16.1Å(now 10.4,conf 0.55)
  - L24↔N17: targets 4.9/16.1Å but partners are 4.7Å apart → too_close_together by 6.5Å
  - C25↔N17: targets 4.1/16.1Å but partners are 9.7Å apart → too_close_together by 2.3Å
- **Y34** — severity 4.06, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): G41@7.4Å(now 4.5,conf 0.55), Y44@11.0Å(now 8.4,conf 0.55), Q22@15.9Å(now 12.7,conf 0.55)
  - E31↔Q22: targets 5.3/15.9Å but partners are 5.8Å apart → too_close_together by 4.9Å
  - G38↔G41: targets 4.0/7.4Å but partners are 0.8Å apart → too_close_together by 2.6Å
- **S27** — severity 3.99, 2 conflict(s); suspect input ~`C19` (group: push_out)
  - push-out (wants farther): E39@17.6Å(now 9.8,conf 0.55), L12@15.2Å(now 8.4,conf 0.55), Y18@15.2Å(now 9.1,conf 0.55), C19@16.3Å(now 9.5,conf 0.55)
  - A32↔C19: targets 8.6/16.3Å but partners are 3.1Å apart → too_close_together by 4.6Å
  - Y18↔A32: targets 15.2/8.6Å but partners are 3.9Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=7 · 3-10(G)=1 · coil(C)=2

```
CHHHHHEHHEHHHHHHHHEEHHHHHHHHHHHEHHHGHHHHHHEEHHC
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=26 · sheet=5
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - C5 ↔ I9  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - N17 ↔ N21  (helix)
  - Y18 ↔ Q22  (helix)
  - N21 ↔ C25  (helix)
  - Q22 ↔ G26  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=307 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=187 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3521 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
