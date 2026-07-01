# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 5.603 A
- tm_score_ca_ordered: 0.5236589359576594
- heavy_atom_rmsd: 6.606 A
- sidechain_heavy_atom_rmsd: 7.446 A
- **all-atom quality (honest):** heavy 6.606 A, sidechain 7.446 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 31
- distogram_pairs: 2092
- bin_accuracy: 0.481

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.602907975436933
- ga_delta_rmsd: 1.696090149630109  ga_fitness_mode: energy
- pre_local_rmsd: 5.6028787365664146  localized_anchor_rmsd: 5.6028787365664146

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T45-K47 → 756 conflicts (56%); S74 → 71 conflicts (5%)
- explained: 827/1359 conflicts by 2 root cause(s)
- metrics: hubs=85 (frac 0.904), conflicts/hub=16.0, max_incompat=16.17Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T45-K47 + S74 — explain ~827/1359 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C52** — severity 162.41, 50 conflict(s); suspect input ~`L76` (group: pull_in)
  - pull-in (wants closer): S55@5.4Å(now 9.0,conf 0.56)
  - push-out (wants farther): K47@27.3Å(now 10.7,conf 0.92), P46@23.2Å(now 8.6,conf 0.76), L29@21.3Å(now 18.3,conf 0.60), A32@20.6Å(now 17.6,conf 0.59), Y44@18.8Å(now 15.3,conf 0.56), F43@18.2Å(now 13.4,conf 0.55), V30@17.8Å(now 14.9,conf 0.55), E31@17.8Å(now 13.8,conf 0.55), N68@8.9Å(now 3.7,conf 0.55), Y34@16.3Å(now 13.1,conf 0.55)
  - K47↔L76: targets 27.3/7.7Å but partners are 5.8Å apart → too_close_together by 13.8Å
  - K47↔I56: targets 27.3/4.7Å but partners are 11.3Å apart → too_close_together by 11.3Å
  - K47↔C57: targets 27.3/4.8Å but partners are 11.7Å apart → too_close_together by 10.8Å
- **I1** — severity 146.37, 48 conflict(s); suspect input ~`P46` (group: push_out)
  - pull-in (wants closer): E39@20.0Å(now 24.9,conf 0.58), T92@19.0Å(now 23.6,conf 0.56), P46@7.6Å(now 19.7,conf 0.55), Y44@9.0Å(now 16.1,conf 0.55), F90@14.9Å(now 18.7,conf 0.55), Y18@8.8Å(now 14.2,conf 0.55), Y34@14.6Å(now 17.6,conf 0.55), G41@16.2Å(now 21.8,conf 0.55), T45@8.0Å(now 20.7,conf 0.55), F89@14.2Å(now 17.4,conf 0.55), V36@14.1Å(now 17.7,conf 0.55)
  - push-out (wants farther): H23@11.3Å(now 6.9,conf 0.55), C25@10.6Å(now 3.9,conf 0.55), Q22@12.1Å(now 8.7,conf 0.55)
  - C52↔P46: targets 27.4/7.6Å but partners are 8.6Å apart → too_close_together by 11.2Å
  - H75↔P46: targets 21.4/7.6Å but partners are 3.1Å apart → too_close_together by 10.7Å
  - G73↔T45: targets 21.9/8.0Å but partners are 3.3Å apart → too_close_together by 10.6Å
- **E3** — severity 129.03, 45 conflict(s); suspect input ~`K47` (group: push_out)
  - pull-in (wants closer): G41@20.0Å(now 22.6,conf 0.58), F42@16.6Å(now 19.6,conf 0.55), K47@7.5Å(now 16.8,conf 0.55), Y44@11.4Å(now 16.7,conf 0.55), T45@9.9Å(now 21.2,conf 0.55)
  - push-out (wants farther): H28@12.5Å(now 8.2,conf 0.55), G26@9.7Å(now 7.0,conf 0.55), C25@8.1Å(now 3.3,conf 0.55)
  - C72↔T45: targets 26.9/9.9Å but partners are 6.1Å apart → too_close_together by 10.9Å
  - I48↔T45: targets 26.8/9.9Å but partners are 6.2Å apart → too_close_together by 10.7Å
  - Q61↔K47: targets 27.4/7.5Å but partners are 9.8Å apart → too_close_together by 10.0Å
- **I56** — severity 124.76, 42 conflict(s); suspect input ~`C52` (group: pull_in)
  - pull-in (wants closer): H70@4.9Å(now 9.7,conf 0.58), F90@18.9Å(now 21.5,conf 0.56), N68@6.1Å(now 9.5,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 11.3,conf 1.00), P46@27.4Å(now 12.2,conf 0.95), H28@23.8Å(now 20.2,conf 0.75), A32@24.0Å(now 19.6,conf 0.74), L35@22.7Å(now 18.8,conf 0.70), V36@25.5Å(now 22.4,conf 0.70), Y44@22.7Å(now 20.1,conf 0.70), F43@22.4Å(now 19.0,conf 0.67), S27@21.9Å(now 16.6,conf 0.63), V30@21.4Å(now 17.5,conf 0.60), E31@21.1Å(now 15.4,conf 0.60)
  - P46↔C52: targets 27.4/4.7Å but partners are 8.6Å apart → too_close_together by 14.1Å
  - K47↔C52: targets 27.5/4.7Å but partners are 10.7Å apart → too_close_together by 12.1Å
  - P46↔H70: targets 27.4/4.9Å but partners are 10.6Å apart → too_close_together by 11.9Å
- **C57** — severity 115.28, 32 conflict(s); suspect input ~`C52` (group: push_out)
  - pull-in (wants closer): V20@27.5Å(now 34.0,conf 1.00), N21@27.5Å(now 33.6,conf 1.00), I9@27.5Å(now 30.4,conf 1.00), Y13@27.5Å(now 30.9,conf 1.00), Q14@27.5Å(now 30.2,conf 1.00), N68@5.3Å(now 8.9,conf 0.56), K94@17.9Å(now 20.5,conf 0.55), T92@16.1Å(now 18.7,conf 0.55)
  - push-out (wants farther): K47@27.4Å(now 11.7,conf 0.97), P46@24.3Å(now 13.2,conf 0.72)
  - K47↔C52: targets 27.4/4.8Å but partners are 10.7Å apart → too_close_together by 11.9Å
  - P46↔C52: targets 24.3/4.8Å but partners are 8.6Å apart → too_close_together by 10.9Å
  - K47↔Q61: targets 27.4/6.2Å but partners are 9.8Å apart → too_close_together by 11.4Å
- **C53** — severity 101.30, 27 conflict(s); suspect input ~`C72` (group: pull_in)
  - pull-in (wants closer): S74@10.9Å(now 14.0,conf 0.55), E78@13.1Å(now 15.7,conf 0.55)
  - push-out (wants farther): T45@22.9Å(now 11.2,conf 0.72), P46@25.0Å(now 9.0,conf 0.69), A32@19.8Å(now 17.3,conf 0.58), N68@11.0Å(now 5.8,conf 0.55), Y34@15.4Å(now 12.9,conf 0.55), Q69@8.1Å(now 5.0,conf 0.55)
  - P46↔C72: targets 25.0/4.8Å but partners are 4.9Å apart → too_close_together by 15.3Å
  - T45↔C72: targets 22.9/4.8Å but partners are 6.1Å apart → too_close_together by 12.0Å
  - P46↔H75: targets 25.0/9.6Å but partners are 3.1Å apart → too_close_together by 12.3Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=23 · 3-10(G)=10 · coil(C)=2

```
CHHHHEHECEGGHHHEGHHHEEGEEEHHHHHHHHHHHHHHGHHEGEHHEHHHEEHEEHHHHHHHHHHHHGHHHHEHGHHHHHHHEHHEGGEEEE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=26 · sheet=27
  - E3 ↔ T7  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - F43 ↔ K47  (helix)
  - K47 ↔ Q51  (helix)
  - I48 ↔ C52  (helix)
  - Q51 ↔ S55  (helix)
  - S55 ↔ L59  (helix)
  - L59 ↔ E63  (helix)
  - Y60 ↔ N64  (helix)
  - E63 ↔ V67  (helix)
  - N64 ↔ N68  (helix)
  - Y65 ↔ Q69  (helix)
  - V67 ↔ L71  (helix)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=40 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=480 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=269 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2128 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=31 (steric clashes)
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
- RMSF mean=3.444Å max=10.007Å (per-residue in .per_residue.csv)
- most flexible residues: 87, 55, 90, 54, 88

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4INS.pae.csv`
- mean=0.695Å · max=4.422Å · AlphaFold-PAE analog (low block = rigid unit/domain)
