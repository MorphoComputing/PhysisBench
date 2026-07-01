# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2ACY/sequence/2ACY.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2ACY/seeds/seed_0/2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 8.852 A
- tm_score_ca_ordered: 0.3548512548895118
- heavy_atom_rmsd: 9.772 A
- sidechain_heavy_atom_rmsd: 10.595 A
- **all-atom quality (honest):** heavy 9.772 A, sidechain 10.595 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 874
- bin_accuracy: 0.341

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.85245345324022
- ga_delta_rmsd: 0.22361710716793404  ga_fitness_mode: energy
- pre_local_rmsd: 8.852491266646384  localized_anchor_rmsd: 8.852491266646384

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H80-V84 → 94 conflicts (24%); R76-A77 → 55 conflicts (14%); K87-L88 → 46 conflicts (12%)
- explained: 195/395 conflicts by 3 root cause(s)
- metrics: hubs=81 (frac 0.844), conflicts/hub=4.9, max_incompat=9.75Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H80-V84 + R76-A77 + K87-L88 — explain ~195/395 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V84** — severity 29.23, 18 conflict(s); suspect input ~`V8` (group: pull_in)
  - pull-in (wants closer): I6@4.6Å(now 9.4,conf 0.60), V8@9.0Å(now 11.7,conf 0.55), E1@10.3Å(now 16.0,conf 0.55)
  - push-out (wants farther): H73@27.5Å(now 24.9,conf 1.00), F21@27.1Å(now 22.3,conf 0.88), I95@23.1Å(now 18.4,conf 0.74), Y24@26.0Å(now 21.8,conf 0.72), N40@25.9Å(now 23.4,conf 0.71), G68@24.7Å(now 19.4,conf 0.70), R22@25.0Å(now 20.9,conf 0.69), T25@22.0Å(now 17.8,conf 0.63), Q26@21.8Å(now 17.6,conf 0.62), E65@21.1Å(now 17.4,conf 0.60), K30@20.1Å(now 17.5,conf 0.58), G29@18.4Å(now 15.7,conf 0.55), W37@17.8Å(now 14.5,conf 0.55), G36@14.8Å(now 11.6,conf 0.55), S55@12.6Å(now 9.0,conf 0.55)
  - R22↔V8: targets 25.0/9.0Å but partners are 11.1Å apart → too_close_together by 4.9Å
  - Q26↔V8: targets 21.8/9.0Å but partners are 7.9Å apart → too_close_together by 4.9Å
  - S7↔G36: targets 6.5/14.8Å but partners are 3.9Å apart → too_close_together by 4.4Å
- **A77** — severity 26.93, 11 conflict(s); suspect input ~`Q26` (group: pull_in)
  - pull-in (wants closer): I12@4.6Å(now 15.2,conf 0.59), Y10@7.0Å(now 11.9,conf 0.55)
  - push-out (wants farther): D89@22.7Å(now 10.5,conf 0.70), Y90@22.0Å(now 7.7,conf 0.63), A27@18.5Å(now 11.5,conf 0.55), Q26@16.6Å(now 11.7,conf 0.55), K71@16.4Å(now 13.5,conf 0.55), V38@13.5Å(now 7.8,conf 0.55)
  - I12↔Q26: targets 4.6/16.6Å but partners are 3.7Å apart → too_close_together by 8.2Å
  - I12↔K30: targets 4.6/19.8Å but partners are 8.7Å apart → too_close_together by 6.4Å
  - I12↔A27: targets 4.6/18.5Å but partners are 7.5Å apart → too_close_together by 6.3Å
- **I12** — severity 24.59, 9 conflict(s); suspect input ~`Q94` (group: push_out)
  - pull-in (wants closer): A77@4.6Å(now 15.2,conf 0.59), S78@6.4Å(now 12.4,conf 0.55), E62@11.8Å(now 17.1,conf 0.55)
  - push-out (wants farther): E1@22.1Å(now 14.5,conf 0.64)
  - A77↔Y90: targets 4.6/20.7Å but partners are 7.7Å apart → too_close_together by 8.3Å
  - A77↔Q94: targets 4.6/16.6Å but partners are 3.8Å apart → too_close_together by 8.2Å
  - S78↔Q94: targets 6.4/16.6Å but partners are 3.1Å apart → too_close_together by 7.1Å
- **E65** — severity 23.62, 11 conflict(s); suspect input ~`Q61` (group: pull_in)
  - pull-in (wants closer): D3@21.7Å(now 24.2,conf 0.61), V16@11.5Å(now 14.5,conf 0.55), Y10@10.2Å(now 13.1,conf 0.55)
  - push-out (wants farther): V86@26.6Å(now 19.2,conf 0.78), K87@26.2Å(now 17.1,conf 0.74), V84@21.1Å(now 17.4,conf 0.60), G33@18.7Å(now 15.8,conf 0.55), K31@17.2Å(now 13.9,conf 0.55), S72@11.1Å(now 7.2,conf 0.55), F21@12.5Å(now 8.7,conf 0.55), H80@13.9Å(now 6.1,conf 0.55), K71@14.0Å(now 11.1,conf 0.55)
  - K87↔Q61: targets 26.2/6.3Å but partners are 11.9Å apart → too_close_together by 8.1Å
  - K87↔M60: targets 26.2/8.6Å but partners are 10.6Å apart → too_close_together by 7.0Å
  - V86↔Q61: targets 26.6/6.3Å but partners are 13.7Å apart → too_close_together by 6.6Å
- **D9** — severity 21.70, 11 conflict(s); suspect input ~`S78` (group: pull_in)
  - pull-in (wants closer): H80@5.2Å(now 10.0,conf 0.57), S78@8.4Å(now 11.2,conf 0.55)
  - push-out (wants farther): G18@21.5Å(now 14.5,conf 0.61), K15@19.5Å(now 13.4,conf 0.57), K67@17.9Å(now 15.3,conf 0.55), T66@16.9Å(now 12.9,conf 0.55), K30@16.9Å(now 11.9,conf 0.55), L32@16.8Å(now 11.0,conf 0.55), G29@13.7Å(now 8.4,conf 0.55), V35@12.2Å(now 5.5,conf 0.55), V38@10.1Å(now 7.1,conf 0.55)
  - H80↔K67: targets 5.2/17.9Å but partners are 5.6Å apart → too_close_together by 7.1Å
  - H80↔T66: targets 5.2/16.9Å but partners are 5.2Å apart → too_close_together by 6.5Å
  - T66↔S78: targets 16.9/8.4Å but partners are 3.1Å apart → too_close_together by 5.4Å
- **T91** — severity 21.40, 10 conflict(s); suspect input ~`V35` (group: pull_in)
  - pull-in (wants closer): V35@6.0Å(now 15.4,conf 0.55), P53@13.9Å(now 18.4,conf 0.55)
  - push-out (wants farther): H73@27.5Å(now 16.8,conf 1.00), S72@27.3Å(now 16.1,conf 0.93), T66@26.5Å(now 12.1,conf 0.76), T45@23.7Å(now 19.9,conf 0.75), L64@20.6Å(now 12.8,conf 0.59), N40@20.3Å(now 17.2,conf 0.59), M60@17.2Å(now 12.1,conf 0.55), I85@14.4Å(now 8.1,conf 0.55)
  - T66↔V35: targets 26.5/6.0Å but partners are 14.2Å apart → too_close_together by 6.3Å
  - T66↔A27: targets 26.5/14.8Å but partners are 5.6Å apart → too_close_together by 6.0Å
  - V35↔V57: targets 6.0/15.3Å but partners are 4.2Å apart → too_close_together by 5.1Å

## Secondary Structure (DSSP-like)

- helix(H)=53 · strand(E)=27 · 3-10(G)=7 · coil(C)=9

```
EHHHHHHEEEHHHHHHHECGCHEHEHHHHHHHCCEEECEHEHHHEGECECEGEEHEHEHHEHEHHHHEHHHHHHHEHGHCGGEHHHHGEHEHHHHC
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=22 · sheet=52
  - G2 ↔ I6  (helix)
  - D3 ↔ S7  (helix)
  - S7 ↔ E11  (helix)
  - E11 ↔ K15  (helix)
  - I12 ↔ V16  (helix)
  - R22 ↔ Q26  (helix)
  - Q26 ↔ K30  (helix)
  - A27 ↔ K31  (helix)
  - N40 ↔ G44  (helix)
  - S55 ↔ H59  (helix)
  - M60 ↔ L64  (helix)
  - E62 ↔ T66  (helix)
  - E65 ↔ S69  (helix)
  - T66 ↔ P70  (helix)
  - K67 ↔ K71  (helix)
  - S69 ↔ H73  (helix)
  - P70 ↔ I74  (helix)
  - K71 ↔ D75  (helix)
  - H73 ↔ A77  (helix)
  - D75 ↔ F79  (helix)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=42 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=531 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=333 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.6172 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2ACY.ensemble.pdb`)
- RMSF mean=4.352Å max=9.985Å (per-residue in .per_residue.csv)
- most flexible residues: 30, 96, 91, 90, 31

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2ACY.pae.csv`
- mean=1.407Å · max=9.967Å · AlphaFold-PAE analog (low block = rigid unit/domain)
