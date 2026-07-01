# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CTF/sequence/1CTF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1CTF/seeds/seed_1/1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 5.814 A
- tm_score_ca_ordered: 0.3410675930313823
- heavy_atom_rmsd: 6.583 A
- sidechain_heavy_atom_rmsd: 7.701 A
- **all-atom quality (honest):** heavy 6.583 A, sidechain 7.701 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 42
- distogram_pairs: 403
- bin_accuracy: 0.355

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.814045144389611
- ga_delta_rmsd: 0.15559538528915962  ga_fitness_mode: energy
- pre_local_rmsd: 5.823983708250604  localized_anchor_rmsd: 5.814006588779179

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I4-I16 → 95 conflicts (66%); G44-D48 → 21 conflicts (15%); K55-A60 → 12 conflicts (8%)
- explained: 128/144 conflicts by 3 root cause(s)
- metrics: hubs=39 (frac 0.591), conflicts/hub=3.7, max_incompat=13.81Å, chain_span=0.97
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I4-I16 + G44-D48 + K55-A60 — explain ~128/144 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A40** — severity 27.80, 11 conflict(s); suspect input ~`A60` (group: push_out)
  - push-out (wants farther): A10@19.5Å(now 12.6,conf 0.57), A60@17.0Å(now 7.0,conf 0.55), G61@16.7Å(now 8.9,conf 0.55), I16@14.3Å(now 8.6,conf 0.55)
  - L5↔A60: targets 6.3/17.0Å but partners are 3.6Å apart → too_close_together by 7.1Å
  - I4↔A10: targets 4.4/19.5Å but partners are 8.3Å apart → too_close_together by 6.7Å
  - I4↔A60: targets 4.4/17.0Å but partners are 6.9Å apart → too_close_together by 5.6Å
- **E63** — severity 26.93, 12 conflict(s); suspect input ~`A8` (group: pull_in)
  - pull-in (wants closer): A8@6.2Å(now 9.9,conf 0.55)
  - push-out (wants farther): S46@19.9Å(now 16.7,conf 0.58), G44@19.6Å(now 12.0,conf 0.57), D48@18.5Å(now 14.4,conf 0.55)
  - G44↔A8: targets 19.6/6.2Å but partners are 5.0Å apart → too_close_together by 8.3Å
  - G44↔I4: targets 19.6/8.8Å but partners are 5.0Å apart → too_close_together by 5.8Å
  - G44↔K55: targets 19.6/10.3Å but partners are 3.9Å apart → too_close_together by 5.4Å
- **V45** — severity 21.83, 9 conflict(s); suspect input ~`F1` (group: push_out)
  - push-out (wants farther): A10@27.4Å(now 12.3,conf 0.94), G9@24.7Å(now 17.1,conf 0.70), E35@22.6Å(now 19.3,conf 0.69), A14@22.4Å(now 17.6,conf 0.67), K31@22.0Å(now 15.1,conf 0.64), V15@19.5Å(now 14.6,conf 0.57), K6@17.5Å(now 10.2,conf 0.55), V64@14.8Å(now 11.8,conf 0.55)
  - A10↔F1: targets 27.4/5.2Å but partners are 8.3Å apart → too_close_together by 13.8Å
  - G9↔F1: targets 24.7/5.2Å but partners are 14.4Å apart → too_close_together by 5.1Å
  - K31↔F1: targets 22.0/5.2Å but partners are 11.9Å apart → too_close_together by 4.9Å
- **E51** — severity 18.12, 9 conflict(s); suspect input ~`A8` (group: push_out)
  - push-out (wants farther): A14@18.6Å(now 15.8,conf 0.55), I16@18.3Å(now 13.4,conf 0.55), A8@17.7Å(now 10.4,conf 0.55), L5@13.1Å(now 10.4,conf 0.55), S46@8.7Å(now 4.6,conf 0.55), G44@12.7Å(now 6.0,conf 0.55)
  - K54↔A8: targets 5.1/17.7Å but partners are 6.5Å apart → too_close_together by 6.2Å
  - A8↔L57: targets 17.7/10.0Å but partners are 3.5Å apart → too_close_together by 4.2Å
  - K54↔I16: targets 5.1/18.3Å but partners are 9.2Å apart → too_close_together by 4.1Å
- **K12** — severity 16.14, 7 conflict(s); suspect input ~`I16` (group: push_out)
  - push-out (wants farther): F1@23.3Å(now 15.1,conf 0.76), D48@24.0Å(now 14.5,conf 0.73), D2@20.5Å(now 17.3,conf 0.59), K55@15.8Å(now 12.2,conf 0.55), K6@12.1Å(now 9.3,conf 0.55)
  - F1↔I16: targets 23.3/5.9Å but partners are 10.2Å apart → too_close_together by 7.2Å
  - D48↔I16: targets 24.0/5.9Å but partners are 11.1Å apart → too_close_together by 7.0Å
  - D48↔K6: targets 24.0/12.1Å but partners are 7.7Å apart → too_close_together by 4.2Å
- **G21** — severity 12.63, 7 conflict(s); suspect input ~`A56` (group: push_out)
  - push-out (wants farther): G9@19.2Å(now 11.6,conf 0.56), K47@19.1Å(now 14.7,conf 0.56), V66@18.6Å(now 14.1,conf 0.55), D32@15.5Å(now 11.8,conf 0.55)
  - G9↔K17: targets 19.2/6.3Å but partners are 7.9Å apart → too_close_together by 4.9Å
  - G9↔V15: targets 19.2/9.8Å but partners are 5.0Å apart → too_close_together by 4.4Å
  - K47↔A56: targets 19.1/9.8Å but partners are 5.2Å apart → too_close_together by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=8 · 3-10(G)=8 · coil(C)=4

```
CEECHHHHHHHHHHHHHHHHHEHGHGHGHHHHHHHHHGHHHHEGHHHEHGHEHHGHGHHHHHECEC
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=31 · sheet=5
  - L5 ↔ G9  (helix)
  - K6 ↔ A10  (helix)
  - A7 ↔ N11  (helix)
  - A8 ↔ K12  (helix)
  - G9 ↔ V13  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - K17 ↔ G21  (helix)
  - V19 ↔ T23  (helix)
  - G21 ↔ L25  (helix)
  - T23 ↔ L27  (helix)
  - L25 ↔ E29  (helix)
  - L27 ↔ K31  (helix)
  - E29 ↔ L33  (helix)
  - A30 ↔ V34  (helix)
  - K31 ↔ E35  (helix)
  - L33 ↔ A37  (helix)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=32 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=525 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=351 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0235 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=42 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
