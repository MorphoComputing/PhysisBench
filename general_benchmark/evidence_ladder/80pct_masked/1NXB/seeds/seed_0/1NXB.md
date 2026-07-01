# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1NXB/sequence/1NXB.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1NXB/seeds/seed_0/1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 5.890 A
- tm_score_ca_ordered: 0.2627000361905398
- heavy_atom_rmsd: 6.724 A
- sidechain_heavy_atom_rmsd: 7.656 A
- **all-atom quality (honest):** heavy 6.724 A, sidechain 7.656 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 25
- distogram_pairs: 331
- bin_accuracy: 0.393

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.890076846974677
- ga_delta_rmsd: 2.4711426799390237  ga_fitness_mode: energy
- pre_local_rmsd: 5.919890228628781  localized_anchor_rmsd: 5.890007056660685

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C16-G19 → 38 conflicts (32%); E57-N60 → 28 conflicts (24%); K50-L51 → 14 conflicts (12%)
- explained: 80/118 conflicts by 3 root cause(s)
- metrics: hubs=38 (frac 0.633), conflicts/hub=3.1, max_incompat=7.02Å, chain_span=0.95
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C16-G19 + E57-N60 + K50-L51 — explain ~80/118 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G19** — severity 18.89, 10 conflict(s); suspect input ~`C2` (group: push_out)
  - push-out (wants farther): Q9@27.3Å(now 17.5,conf 0.93), P10@27.1Å(now 16.6,conf 0.87), Q5@21.4Å(now 17.2,conf 0.60), L51@20.8Å(now 16.6,conf 0.59), T12@20.6Å(now 14.6,conf 0.59), T15@11.1Å(now 5.1,conf 0.55), K14@14.1Å(now 8.7,conf 0.55)
  - P10↔C2: targets 27.1/13.3Å but partners are 8.6Å apart → too_close_together by 5.2Å
  - P10↔K14: targets 27.1/14.1Å but partners are 8.6Å apart → too_close_together by 4.4Å
  - P10↔C40: targets 27.1/10.7Å but partners are 12.7Å apart → too_close_together by 3.7Å
- **G48** — severity 11.41, 6 conflict(s); suspect input ~`L51` (group: pull_in)
  - pull-in (wants closer): F31@13.5Å(now 23.7,conf 0.55)
  - push-out (wants farther): V58@24.2Å(now 19.5,conf 0.72), N60@19.1Å(now 13.4,conf 0.56), G41@18.3Å(now 15.3,conf 0.55)
  - N60↔L51: targets 19.1/9.6Å but partners are 4.5Å apart → too_close_together by 5.1Å
  - V58↔L51: targets 24.2/9.6Å but partners are 10.8Å apart → too_close_together by 3.8Å
  - N60↔V45: targets 19.1/8.9Å but partners are 6.5Å apart → too_close_together by 3.6Å
- **V58** — severity 10.75, 5 conflict(s); suspect input ~`Y24` (group: push_out)
  - push-out (wants farther): R32@27.3Å(now 23.2,conf 0.91), P47@26.3Å(now 16.0,conf 0.74), G33@24.2Å(now 20.2,conf 0.73), G48@24.2Å(now 19.5,conf 0.72), K50@18.8Å(now 13.1,conf 0.56), P43@17.3Å(now 13.1,conf 0.55), C40@10.1Å(now 6.2,conf 0.55)
  - P47↔Y24: targets 26.3/10.0Å but partners are 10.3Å apart → too_close_together by 6.0Å
  - P47↔K50: targets 26.3/18.8Å but partners are 3.0Å apart → too_close_together by 4.4Å
  - P47↔H25: targets 26.3/10.8Å but partners are 11.5Å apart → too_close_together by 3.9Å
- **I36** — severity 10.54, 8 conflict(s); suspect input ~`F3` (group: pull_in)
  - pull-in (wants closer): K50@8.7Å(now 11.9,conf 0.55)
  - push-out (wants farther): P18@23.8Å(now 14.1,conf 0.75), I1@17.7Å(now 8.0,conf 0.55), S22@16.7Å(now 14.1,conf 0.55), F3@11.2Å(now 7.2,conf 0.55), N4@9.9Å(now 4.3,conf 0.55)
  - I1↔F3: targets 17.7/11.2Å but partners are 2.2Å apart → too_close_together by 4.2Å
  - P18↔F3: targets 23.8/11.2Å but partners are 9.4Å apart → too_close_together by 3.2Å
  - P18↔Q11: targets 23.8/12.7Å but partners are 8.9Å apart → too_close_together by 2.2Å
- **E57** — severity 10.11, 5 conflict(s); suspect input ~`N60` (group: push_out)
  - push-out (wants farther): K46@23.4Å(now 13.6,conf 0.76), L51@17.6Å(now 10.8,conf 0.55), E37@16.4Å(now 12.8,conf 0.55), C53@11.6Å(now 6.4,conf 0.55)
  - K46↔N60: targets 23.4/8.4Å but partners are 9.2Å apart → too_close_together by 5.8Å
  - L51↔N60: targets 17.6/8.4Å but partners are 4.5Å apart → too_close_together by 4.7Å
  - K46↔C53: targets 23.4/11.6Å but partners are 8.0Å apart → too_close_together by 3.8Å
- **K50** — severity 8.31, 5 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): K26@5.1Å(now 9.5,conf 0.57), I36@8.7Å(now 11.9,conf 0.55), I35@9.8Å(now 15.3,conf 0.55)
  - push-out (wants farther): P18@26.1Å(now 19.6,conf 0.72), V58@18.8Å(now 13.1,conf 0.56), C59@16.4Å(now 10.3,conf 0.55)
  - P18↔K26: targets 26.1/5.1Å but partners are 15.3Å apart → too_close_together by 5.7Å
  - P18↔I36: targets 26.1/8.7Å but partners are 14.1Å apart → too_close_together by 3.3Å
  - T12↔I36: targets 20.6/8.7Å but partners are 9.5Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=22 · 3-10(G)=6 · coil(C)=6

```
CHHEHHEEHCHHHEHEHEGEHEHECEECCHHEEGECHEGHEHEGHHEHEGGHHHEHEHHE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=8 · sheet=54
  - C2 ↔ H6  (helix)
  - Q5 ↔ Q9  (helix)
  - Q11 ↔ T15  (helix)
  - S17 ↔ S21  (helix)
  - C42 ↔ K46  (helix)
  - G48 ↔ S52  (helix)
  - S52 ↔ S56  (helix)
  - C54 ↔ V58  (helix)
  - N4 ↔ K14  (sheet)
  - N4 ↔ C16  (sheet)
  - N4 ↔ P18  (sheet)
  - N4 ↔ Y24  (sheet)
  - S7 ↔ K14  (sheet)
  - S7 ↔ C16  (sheet)
  - S7 ↔ Y24  (sheet)
  - S7 ↔ K26  (sheet)
  - S7 ↔ Q27  (sheet)
  - S8 ↔ K14  (sheet)
  - S8 ↔ C16  (sheet)
  - S8 ↔ P18  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=334 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=224 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1124 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=25 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
