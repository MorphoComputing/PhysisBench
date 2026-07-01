# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/4INS/sequence/4INS.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/4INS/seeds/seed_0/4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 7.529 A
- tm_score_ca_ordered: 0.3406351940394187
- heavy_atom_rmsd: 8.783 A
- sidechain_heavy_atom_rmsd: 9.902 A
- **all-atom quality (honest):** heavy 8.783 A, sidechain 9.902 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 38
- distogram_pairs: 836
- bin_accuracy: 0.360

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.528872140937078
- ga_delta_rmsd: 0.4946197992624466  ga_fitness_mode: energy
- pre_local_rmsd: 7.533298362751643  localized_anchor_rmsd: 7.5288610809547105

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G41-K47 → 174 conflicts (47%); Y18-C19 → 42 conflicts (11%); Y65-N68 → 32 conflicts (9%)
- explained: 248/372 conflicts by 3 root cause(s)
- metrics: hubs=75 (frac 0.798), conflicts/hub=5.0, max_incompat=10.73Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G41-K47 + Y18-C19 + Y65-N68 — explain ~248/372 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 73.58, 33 conflict(s); suspect input ~`G41` (group: pull_in)
  - pull-in (wants closer): G41@5.8Å(now 11.4,conf 0.55), Q14@10.1Å(now 12.8,conf 0.55)
  - push-out (wants farther): V67@27.5Å(now 24.7,conf 1.00), Q69@26.4Å(now 22.3,conf 0.76), S55@24.7Å(now 19.1,conf 0.70), S58@25.5Å(now 20.4,conf 0.70), E50@20.1Å(now 15.8,conf 0.58), G26@17.9Å(now 11.9,conf 0.55), L24@16.9Å(now 11.9,conf 0.55), S27@16.7Å(now 12.8,conf 0.55), L12@11.1Å(now 7.7,conf 0.55)
  - S55↔G41: targets 24.7/5.8Å but partners are 8.2Å apart → too_close_together by 10.7Å
  - S58↔G41: targets 25.5/5.8Å but partners are 9.7Å apart → too_close_together by 10.1Å
  - Q69↔G41: targets 26.4/5.8Å but partners are 12.4Å apart → too_close_together by 8.2Å
- **Y18** — severity 60.73, 24 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): F43@5.9Å(now 12.4,conf 0.55), Y44@7.5Å(now 10.3,conf 0.55)
  - push-out (wants farther): S55@27.3Å(now 23.1,conf 0.93), S58@26.8Å(now 23.2,conf 0.81), T54@25.5Å(now 21.8,conf 0.70), N21@16.6Å(now 5.1,conf 0.55), C6@15.8Å(now 10.5,conf 0.55), I9@16.0Å(now 8.2,conf 0.55)
  - S58↔F43: targets 26.8/5.9Å but partners are 11.2Å apart → too_close_together by 9.7Å
  - S55↔F43: targets 27.3/5.9Å but partners are 11.8Å apart → too_close_together by 9.6Å
  - T54↔F43: targets 25.5/5.9Å but partners are 10.6Å apart → too_close_together by 9.0Å
- **C57** — severity 39.19, 16 conflict(s); suspect input ~`N68` (group: pull_in)
  - pull-in (wants closer): V20@27.5Å(now 30.7,conf 1.00), L80@12.0Å(now 15.8,conf 0.55)
  - push-out (wants farther): K47@27.4Å(now 17.4,conf 0.97), P46@24.3Å(now 12.9,conf 0.72), V36@24.9Å(now 20.8,conf 0.69), L33@22.3Å(now 19.7,conf 0.66)
  - P46↔N68: targets 24.3/5.3Å but partners are 9.6Å apart → too_close_together by 9.4Å
  - K47↔N68: targets 27.4/5.3Å but partners are 13.7Å apart → too_close_together by 8.5Å
  - P46↔L71: targets 24.3/8.0Å but partners are 10.2Å apart → too_close_together by 6.2Å
- **I1** — severity 31.58, 13 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): P46@7.6Å(now 17.8,conf 0.55), Y44@9.0Å(now 14.5,conf 0.55)
  - push-out (wants farther): T92@19.0Å(now 13.6,conf 0.56), C5@6.0Å(now 3.4,conf 0.55), H23@11.3Å(now 3.7,conf 0.55)
  - T54↔P46: targets 27.5/7.6Å but partners are 10.2Å apart → too_close_together by 9.8Å
  - Q4↔P46: targets 5.1/7.6Å but partners are 21.0Å apart → too_far_apart by 8.4Å
  - S55↔P46: targets 27.5/7.6Å but partners are 12.1Å apart → too_close_together by 7.8Å
- **G41** — severity 25.77, 13 conflict(s); suspect input ~`C19` (group: pull_in)
  - pull-in (wants closer): Y91@5.2Å(now 7.7,conf 0.56), C19@5.8Å(now 11.4,conf 0.55)
  - push-out (wants farther): I56@19.9Å(now 13.4,conf 0.58), K47@19.8Å(now 13.1,conf 0.57), E63@17.0Å(now 13.9,conf 0.55), G73@11.1Å(now 6.8,conf 0.55), C72@13.6Å(now 5.7,conf 0.55), S27@16.0Å(now 12.9,conf 0.55)
  - V20↔C19: targets 22.0/5.8Å but partners are 9.0Å apart → too_close_together by 7.2Å
  - N21↔C19: targets 21.5/5.8Å but partners are 9.8Å apart → too_close_together by 5.9Å
  - Y91↔S27: targets 5.2/16.0Å but partners are 5.4Å apart → too_close_together by 5.4Å
- **N68** — severity 24.33, 9 conflict(s); suspect input ~`Q61` (group: push_out)
  - push-out (wants farther): C25@27.4Å(now 24.5,conf 0.96), P46@27.3Å(now 9.6,conf 0.92), G26@23.5Å(now 20.7,conf 0.76), K94@22.5Å(now 17.8,conf 0.68), V30@21.9Å(now 15.9,conf 0.63), S27@21.1Å(now 15.9,conf 0.60), L62@10.8Å(now 7.8,conf 0.55), Y65@16.4Å(now 5.9,conf 0.55), L71@9.4Å(now 6.8,conf 0.55), Q61@9.7Å(now 3.5,conf 0.55), V77@15.8Å(now 12.2,conf 0.55)
  - P46↔C57: targets 27.3/5.3Å but partners are 12.9Å apart → too_close_together by 9.1Å
  - P46↔Q61: targets 27.3/9.7Å but partners are 9.0Å apart → too_close_together by 8.7Å
  - P46↔L71: targets 27.3/9.4Å but partners are 10.2Å apart → too_close_together by 7.7Å

## Secondary Structure (DSSP-like)

- helix(H)=66 · strand(E)=11 · 3-10(G)=15 · coil(C)=2

```
CHHHEGHEHHHHHGHEHEHHEEGHHGHHHGHHHHHHHGHGHHHHGHHGGHHHHHHHGGHHHHGHHHHEEHHHEHHHHHHEGHHHHHHHGHHCHE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=41 · sheet=12
  - E3 ↔ T7  (helix)
  - T7 ↔ S11  (helix)
  - S11 ↔ L15  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - V20 ↔ L24  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - E39 ↔ F43  (helix)
  - F42 ↔ P46  (helix)
  - F43 ↔ K47  (helix)
  - P46 ↔ E50  (helix)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=40 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=604 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=379 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1861 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=38 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4INS.ensemble.pdb`)
- RMSF mean=2.44Å max=7.153Å (per-residue in .per_residue.csv)
- most flexible residues: 21, 17, 20, 36, 54

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4INS.pae.csv`
- mean=1.003Å · max=5.285Å · AlphaFold-PAE analog (low block = rigid unit/domain)
