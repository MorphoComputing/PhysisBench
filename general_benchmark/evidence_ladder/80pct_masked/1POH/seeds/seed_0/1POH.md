# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1POH/sequence/1POH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1POH/seeds/seed_0/1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 8.865 A
- tm_score_ca_ordered: 0.2762470579003918
- heavy_atom_rmsd: 10.058 A
- sidechain_heavy_atom_rmsd: 11.308 A
- **all-atom quality (honest):** heavy 10.058 A, sidechain 11.308 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 50
- distogram_pairs: 648
- bin_accuracy: 0.395

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.864920845984132
- ga_delta_rmsd: -2.356446533062919  ga_fitness_mode: energy
- pre_local_rmsd: 8.86493811179147  localized_anchor_rmsd: 8.86493811179147

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V59-A64 → 63 conflicts (44%); K23-K26 → 23 conflicts (16%); R16 → 10 conflicts (7%)
- explained: 96/143 conflicts by 3 root cause(s)
- metrics: hubs=44 (frac 0.53), conflicts/hub=3.2, max_incompat=7.93Å, chain_span=0.988
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V59-A64 + K23-K26 + R16 — explain ~96/143 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F1** — severity 35.51, 20 conflict(s); suspect input ~`T33` (group: pull_in)
  - pull-in (wants closer): A64@5.6Å(now 8.2,conf 0.56)
  - push-out (wants farther): F47@23.1Å(now 20.1,conf 0.75), H14@25.8Å(now 21.4,conf 0.71), A18@21.5Å(now 15.5,conf 0.61), S45@19.4Å(now 16.3,conf 0.57), E24@17.4Å(now 9.1,conf 0.55), K26@17.0Å(now 7.7,conf 0.55), E67@10.9Å(now 8.4,conf 0.55), A25@14.6Å(now 11.9,conf 0.55)
  - A64↔K26: targets 5.6/17.0Å but partners are 3.5Å apart → too_close_together by 7.9Å
  - A64↔E24: targets 5.6/17.4Å but partners are 5.7Å apart → too_close_together by 6.2Å
  - S45↔A64: targets 19.4/5.6Å but partners are 9.6Å apart → too_close_together by 4.3Å
- **E24** — severity 15.06, 8 conflict(s); suspect input ~`L83` (group: pull_in)
  - pull-in (wants closer): L83@12.3Å(now 15.7,conf 0.55)
  - push-out (wants farther): G38@22.9Å(now 13.9,conf 0.72), N11@19.9Å(now 16.8,conf 0.58), F1@17.4Å(now 9.1,conf 0.55), S45@11.3Å(now 8.3,conf 0.55), K44@8.5Å(now 4.5,conf 0.55), E69@13.5Å(now 10.4,conf 0.55)
  - G38↔S45: targets 22.9/11.3Å but partners are 7.2Å apart → too_close_together by 4.4Å
  - G38↔K44: targets 22.9/8.5Å but partners are 10.2Å apart → too_close_together by 4.2Å
  - N11↔L83: targets 19.9/12.3Å but partners are 3.8Å apart → too_close_together by 3.7Å
- **R16** — severity 14.04, 7 conflict(s); suspect input ~`V22` (group: push_out)
  - push-out (wants farther): E65@26.5Å(now 22.1,conf 0.77), G38@23.9Å(now 13.3,conf 0.74), E74@20.9Å(now 17.9,conf 0.59), S36@19.4Å(now 13.4,conf 0.57), V5@19.1Å(now 14.9,conf 0.56), Q56@15.1Å(now 10.6,conf 0.55), L49@13.2Å(now 8.7,conf 0.55), Q50@12.3Å(now 7.9,conf 0.55), L52@16.1Å(now 13.4,conf 0.55), T55@14.0Å(now 10.0,conf 0.55)
  - G38↔Q50: targets 23.9/12.3Å but partners are 6.1Å apart → too_close_together by 5.5Å
  - G38↔L49: targets 23.9/13.2Å but partners are 5.6Å apart → too_close_together by 5.1Å
  - E65↔V22: targets 26.5/10.1Å but partners are 12.6Å apart → too_close_together by 3.8Å
- **K23** — severity 12.46, 6 conflict(s); suspect input ~`A43` (group: push_out)
  - push-out (wants farther): K39@20.9Å(now 17.7,conf 0.59), V59@20.6Å(now 14.1,conf 0.59), T61@18.2Å(now 13.7,conf 0.55), V60@18.1Å(now 15.1,conf 0.55), E65@17.9Å(now 12.9,conf 0.55), A64@15.6Å(now 8.5,conf 0.55), D68@16.1Å(now 13.3,conf 0.55), E31@13.8Å(now 11.3,conf 0.55)
  - K26↔A64: targets 5.3/15.6Å but partners are 3.5Å apart → too_close_together by 6.8Å
  - K26↔E65: targets 5.3/17.9Å but partners are 7.9Å apart → too_close_together by 4.7Å
  - V59↔A43: targets 20.6/9.1Å but partners are 7.8Å apart → too_close_together by 3.7Å
- **S36** — severity 11.19, 7 conflict(s); suspect input ~`P17` (group: push_out)
  - push-out (wants farther): R16@19.4Å(now 13.4,conf 0.57), E74@17.7Å(now 14.1,conf 0.55), P17@17.1Å(now 9.2,conf 0.55), V22@15.9Å(now 12.2,conf 0.55)
  - V59↔P17: targets 6.8/17.1Å but partners are 5.4Å apart → too_close_together by 4.8Å
  - R16↔V59: targets 19.4/6.8Å but partners are 8.7Å apart → too_close_together by 3.9Å
  - P17↔L49: targets 17.1/9.7Å but partners are 4.8Å apart → too_close_together by 2.6Å
- **T61** — severity 10.90, 6 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): E4@4.5Å(now 8.0,conf 0.60)
  - push-out (wants farther): K23@18.2Å(now 13.7,conf 0.55), Q20@18.0Å(now 12.1,conf 0.55), K26@17.4Å(now 11.6,conf 0.55), A18@15.4Å(now 11.3,conf 0.55), A41@10.6Å(now 4.2,conf 0.55), L52@11.8Å(now 7.7,conf 0.55), A25@14.0Å(now 9.2,conf 0.55)
  - E4↔H75: targets 4.5/13.2Å but partners are 3.6Å apart → too_close_together by 5.2Å
  - E4↔G38: targets 4.5/9.4Å but partners are 18.2Å apart → too_far_apart by 4.2Å
  - V34↔K26: targets 5.7/17.4Å but partners are 8.3Å apart → too_close_together by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=26 · 3-10(G)=10 · coil(C)=4

```
CEEEEHCEEGEHEHGEHHHEHHHEHEEHHHEGHHEHHHEHHHHHGHHGGECHGHHHHEHHEGEEEHEHHEHGEEGHHHHHHHC
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=22 · sheet=32
  - H14 ↔ A18  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - A19 ↔ K23  (helix)
  - F21 ↔ A25  (helix)
  - A25 ↔ T29  (helix)
  - T29 ↔ T33  (helix)
  - S30 ↔ V34  (helix)
  - T33 ↔ N37  (helix)
  - V34 ↔ G38  (helix)
  - S36 ↔ S40  (helix)
  - N37 ↔ A41  (helix)
  - G38 ↔ S42  (helix)
  - S40 ↔ K44  (helix)
  - S42 ↔ L46  (helix)
  - A43 ↔ F47  (helix)
  - L52 ↔ Q56  (helix)
  - T55 ↔ V59  (helix)
  - Q56 ↔ V60  (helix)
  - L76 ↔ M80  (helix)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=36 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=568 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=393 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1155 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=50 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
